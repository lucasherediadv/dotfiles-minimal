#!/bin/bash

case $- in
*i*) ;; # interactive
*) return ;;
esac

# local utility functions
_have() { type "$1" &>/dev/null; }

# prompt
PS1='[\u@\h \W]\$ '

# history
set -o vi
export HISTSIZE=5000
export HISTFILESIZE=10000
shopt -s cmdhist # Save multi-line commands as one command
shopt -s histappend # Append to the history file, don't overwrite it

# bash/shell options
shopt -s checkwinsize # Update window size after every command
shopt -s globstar 2> /dev/null # Turn on recursive globbing (enables ** to recurse all directories)
set -o noclobber # Prevent file overwrite on stdout redirection. Use ">|" to force redirection to an existing file

# aliases
unalias -a
alias c='clear'
alias ls='ls --color=auto -h'

# editor configuration
set-editor() {
  export EDITOR="$1"
  export VISUAL="$1"
  alias vi="\$EDITOR"
}

_have "vi" && set-editor vi
_have "vim" && set-editor vim
