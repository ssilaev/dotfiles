#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.
#
# Adds `~/.local/bin` to $PATH

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

export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export TERMINAL="alacritty"
export TERM="xterm-256color"
export EDITOR="vim"
export VISUAL='vim'
export BROWSER="firefox"
export FILE="mc"
export GPG_KEY="64D02F3AA9448C0E991A8BDA3E783B51D2119EAE"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-" # can be used to disable this feature.
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export OH_MY_ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-zsh"
export ZSH_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
