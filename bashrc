#
# ~/.bashrc
#


if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# Set  Variables
# Syntax highlighting for man pages using bat
# export MANAGER="sh -c 'col -bx | bat -l man -p'"
# . "$HOME/.cargo/env"

# Arch config
#export PATH="$PATH:$(go env GOPATH)/bin"
#export GOPATH=~/go 
#export PATH=$PATH:/usr/bin/go
export PATH=$PATH:/usr/local/go/bin

# exec zsh
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"

# Vim default editor
export VISUAL=vim
export EDITOR="$VISUAL"
exec zsh
