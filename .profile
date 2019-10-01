export TERMINAL="alacritty"
export EDITOR="vim"
export BROWSER="firefox"
export FILE="ranger"
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export PATH="$HOME/.cargo/bin:$PATH"
export GPG_KEY=""

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
