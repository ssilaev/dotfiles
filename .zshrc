export TERMINAL="alacritty"
export TERM="xterm-256color"
export EDITOR="vim"
export VISUAL='vim'
export BROWSER="firefox"
export FILE="mc"

# Languages

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Paths
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# Environment Variables
export GPG_KEY="64D02F3AA9448C0E991A8BDA3E783B51D2119EAE"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export ZSH="/home/ssv/.oh-my-zsh"

ZSH_THEME="afowler"

plugins=(
	direnv
	docker
	git
)

source $ZSH/oh-my-zsh.sh

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

tldr() {
  curl "cheat.sh/$@"
}

# Aliases
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias calcurse='calcurse -D ~/.config/calcurse'
alias nc='ncmpcpp'
alias mpv_cam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
