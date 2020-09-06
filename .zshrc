source $HOME/.zshenv

export ZSH="/home/ssv/.oh-my-zsh"

ZSH_THEME="afowler"

plugins=(
	# direnv
	# docker
	git
)

source $ZSH/oh-my-zsh.sh

# Aliases

alias g='git'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias calcurse='calcurse -D ~/.config/calcurse'
alias nc='ncmpcpp'
alias mpv_cam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
