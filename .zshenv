export TERMINAL="alacritty"
export TERM="xterm-256color"
export EDITOR="vim"
export VISUAL='vim'
export BROWSER="firefox"
export FILE="mc"
export GPG_KEY="64D02F3AA9448C0E991A8BDA3E783B51D2119EAE"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export ZSH="/home/ssv/.oh-my-zsh"
export GPG_KEY="64D02F3AA9448C0E991A8BDA3E783B51D2119EAE"

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

