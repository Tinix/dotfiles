# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tinix/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Themes usados
# ZSH_THEME="intheloop"
# ZSH_THEME="jbergantine"
# ZSH_THEME="sobole"
# ZSH_THEME="gnzh"
#ZSH_THEME="awesomepanda"
#ZSH_THEME="gruvbox"
# ZSH_THEME="cloud"
ZSH_THEME="robbyrussell"

SOLARIZED_THEME="dark"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

 if  [ -f ~/.aliases ]; then
    . ~/.aliases
 fi

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

PATH="$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tinix/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tinix/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tinix/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tinix/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Handly Functions
function mkd(){ 
  mkdir -p "$@" && cd "$_";
}

# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# Export my personal console command %{Tinix} 
PATH=$HOME/dotfiles/bin:$HOME/dotfiles/bin:$PATH
PATH=$HOME/dotfiles/dep/local-dev/bin:$HOME/dotfiles/dep/local-dev/bin:$PATH
PATH=$HOME/dotfiles/dep/local-dev-generic-code/bin:$HOME/dotfiles/dep/local-dev-generic-code/bin:$PATH
export PATH 

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

