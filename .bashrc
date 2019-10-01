#!/bin/bash

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

if [ -f ~/.scripts/git-prompt.sh ]; then
    . ~/.scripts/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWCOLORHINTS=true
    GIT_PS1_UNTRACKEDFILES=true
    PROMPT_COMMAND="__git_ps1 '\w' '\\$ '"
    #PROMPT_COMMAND="__git_ps1 '\[$(tput bold)\]\[$(tput setaf 2)\][\w\[$(tput setaf 2)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]' ''"
fi

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

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vi="vim"
alias calcurse="calcurse -D ~/.config/calcurse"
