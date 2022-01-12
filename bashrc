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

PATH="$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# Homebrew
#eval $(~/.linuxbrew/bin/brew shellenv)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Set  Variables
# Syntax highlighting for man pages using bat
export MANAGER="sh -c 'col -bx | bat -l man -p'"
. "$HOME/.cargo/env"
