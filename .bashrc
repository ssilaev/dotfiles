#!/bin/bash

#export PATH="$HOME/.poetry/bin:$PATH"
#export PATH="${PATH}:${HOME}/.krew/bin"
#export HEAP="-Xms512m -Xmx2048m"

export TERMINAL="alacritty"
export TERM="xterm-256color"
export EDITOR="vim"
export BROWSER="firefox"
export FILE="mc"
export PATH="$HOME/.local/bin:$PATH"
export GOPATH=$HOME/golib
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:${HOME}/jmeter/apache-jmeter-5.3/bin/"
export PATH="$HOME/.cargo/bin:$PATH"
export GPG_KEY="64D02F3AA9448C0E991A8BDA3E783B51D2119EAE"

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Aliases
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias calcurse='calcurse -D ~/.config/calcurse'
alias nc='ncmpcpp'
alias mpv_cam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
