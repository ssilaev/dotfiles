# Turn on parallel history
shopt -s histappend
history -a

# Turn on checkwinsize
shopt -s checkwinsize

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Aliases
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias calcurse='calcurse -D ~/.config/calcurse'
alias nc='ncmpcpp'
alias mpv_cam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
# alias vim="nvim"

source /home/ssv/.local/bin/activate.sh
