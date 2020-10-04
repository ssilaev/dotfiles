#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/inotify.h>
#include <unistd.h>

#define EVENT_SIZE  (sizeof(struct inotify_event))
#define BUF_LEN     (1024 * (EVENT_SIZE + 16))
#define DIR_FROM    "/home/ssv/tmp1/"
#define DIR_TO      "/home/ssv/tmp2/"
#define LOCK_FILE   "/tmp/rsync.lock"

/* Inotify monitoring of directories is not recursive: to monitor
 * subdirectories under a directory, additional watches must be created. */

/* IN_ACCESS — the file was read. */
/* IN_MODIFY — the file was written to. */
/* IN_ATTRIB — the attributes of the file changed. */
/* IN_CLOSE_WRITE — a file that was opened for writing was closed. */
/* IN_CLOSE_NOWRITE — a file that was opened not for writing was closed. */
/* IN_OPEN — the file was opened. */
/* IN_MOVED_FROM — the file was moved or renamed away from the item being watched. */
/* IN_MOVED_TO — the file was moved or renamed to the item being watched. */
/* IN_CREATE — a file was created in a watched directory. */
/* IN_DELETE — a file or directory was deleted. */
/* IN_DELETE_SELF — the file or directory being monitored was deleted. */
/* IN_MOVE_SELF — the file or directory being monitored was moved or renamed. */
/*  */
/* IN_UNMOUNT — the backing filesystem was unmounted. */
/* IN_Q_OVERFLOW — the inotify queue overflowed. */
/* IN_IGNORED — the watch was automatically removed because the file was deleted,
 *              or its filesystem was unmounted. */
/* IN_ISDIR — the event occurred against a directory. */

int main(int argc, char **argv) {
    while(1) {
        int length, i = 0;
        int fd;
        int wd;
        char buffer[BUF_LEN];

        fd = inotify_init();

        if (fd < 0) {
            perror("inotify_init");
        }

        wd = inotify_add_watch(fd, DIR_FROM,
            IN_MODIFY | IN_CREATE | IN_DELETE | IN_MOVED_FROM | IN_MOVED_TO);
        length = read(fd, buffer, BUF_LEN);

        if (length < 0) {
            perror("read");
        }

        // main loop
        while (i < length) {
            struct inotify_event *event =
                (struct inotify_event *) &buffer[i];

            if (event->len) {

                printf("EVENT: %s\n", event->name);
                system("flock -n "LOCK_FILE " -c \"rsync -auv --delete " DIR_FROM " " DIR_TO "\"");

                /* // IN_CREATE */
                /* if (event->mask & IN_CREATE) { */
                /*     printf("The file %s was created.\n", event->name); */
                /*  */
                /* // IN_DELETE */
                /* } else if (event->mask & IN_DELETE) { */
                /*     printf("The file %s was deleted.\n", event->name); */
                /*  */
                /* // IN_MODIFY */
                /* } else if (event->mask & IN_MODIFY) { */
                /*     printf("The file %s was modified.\n", event->name); */
                /*  */
                /* // IN_MOVED_FROM */
                /* } else if (event->mask & IN_MOVED_FROM) { */
                /*     printf("The file %s was moved from.\n", event->name); */
                /*  */
                /* // IN_MOVED_TO */
                /* } else if (event->mask & IN_MOVED_TO) { */
                /*     printf("The file %s was moved to.\n", event->name); */
                /* } */
            }

            i += EVENT_SIZE + event->len;
        }

        (void) inotify_rm_watch(fd, wd);
        (void) close(fd);

    }
        return 0;
}
