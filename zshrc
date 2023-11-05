# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tinix/.oh-my-zsh"

# Themes usados
# ZSH_THEME="intheloop"
# ZSH_THEME="jbergantine"
# ZSH_THEME="sobole"
# ZSH_THEME="gnzh"
# ZSH_THEME="agnoster"
# ZSH_THEME="awesomepanda"
# ZSH_THEME="gruvbox"
# ZSH_THEME="cloud"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="half-life"

# ZSH_THEME="nanotech"
# ZSH_THEME="bira"

# ZSH_THEME="fletcherm"
# ZSH_THEME="darkblood"
# ZSH_THEME="jnrowe"
# ZSH_THEME="jonathan" 
# ZSH_THEME="sonicradish"

ZSH_THEME="intheloop"

# SOLARIZED_THEME="dark"

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
   export EDITOR='vim'
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


# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# Export my personal console command %{Tinix} 
PATH=$HOME/dotfiles/bin:$HOME/dotfiles/bin:$PATH
PATH=$HOME/dotfiles/dep/local-dev/bin:$HOME/dotfiles/dep/local-dev/bin:$PATH
PATH=$HOME/dotfiles/dep/local-dev-generic-code/bin:$HOME/dotfiles/dep/local-dev-generic-code/bin:$PATH
export PATH 

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

CLIENT_ID=92c86ade47998bc64605
CLIENT_SECRET=36a6a986877353612d7a35cb6f36349c86ff2b4c
GITHUB_LOGIN='dtinivella@gmail.com'
GITHUB_PASSWORD='p_kQhzt4E6HNPVMUJzUVWJy4gN9SOdLu2QVIBE'

# Arch config
# export PATH="$PATH:$(go env GOPATH)/bin"
# export GOPATH=~/go
# export PATH=$PATH:/usr/bin/go

# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

# Debian config
export PATH=$PATH:/usr/local/go/bin

# Nova framework to erlang Api
export PATH=/home/tinix/.cache/rebar3/bin:$PATH

export PATH="HOME/.cargo/bin/:$PATH"

source $HOME/.cargo/env

export VISUAL=vim
export EDITOR="$VISUAL"

. /home/tinix/.asdf/asdf.sh
. /home/tinix/.asdf/completions/asdf.bash

# Var environment Amber framework
export DATABASE_URL="postgres://tinix:password@localhost/blog_development"
