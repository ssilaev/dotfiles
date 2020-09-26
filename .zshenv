
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

export PATH="$HOME/.local/bin:$HOME/jmeter/apache-jmeter-5.3/bin/:$HOME/.cargo/bin:$PATH"
export GPG_KEY="64D02F3AA9448C0E991A8BDA3E783B51D2119EAE"
