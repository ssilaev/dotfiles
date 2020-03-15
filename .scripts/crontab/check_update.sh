#!/bin/sh
# Syncs repositories and downloads updates, meant to be run as a cronjob.

ping -q -c 1 1.1.1.1 > /dev/null || exit

notify-send "📦 Checking for package updates..."

sudo pacman -Syy

if pacman -Qu | grep -v "\[ignored\]"
then
    notify-send "🎁 Package updates available. Click statusbar icon (📦) for update."
else
    notify-send "📦 Repository sync complete. No new packages for update."
fi
