# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tinix/.oh-my-zsh"

# Themes usados
ZSH_THEME="intheloop"
# ZSH_THEME="jbergantine"
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

# ZSH_THEME="intheloop"
# ZSH_THEME="fino"
# ZSH_THEME="strug"
# SOLARIZED_THEME="gruvbox-dark"

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

# Go config
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
# Debian config
# export PATH=$PATH:/usr/local/go/bin
plugins=(… buffalo)
  autoload -U compinit && compinit



# Nova framework to erlang Api
export PATH=/home/tinix/.cache/rebar3/bin:$PATH

export PATH="HOME/.cargo/bin/:$PATH"

source $HOME/.cargo/env

export VISUAL=vim
export EDITOR="$VISUAL"

. /home/tinix/.asdf/asdf.sh
. /home/tinix/.asdf/completions/asdf.bash

# Var environment Amber framework
# export DATABASE_URL="postgres://tinix:password@localhost/blog_development"

 # OpenAI- ChatGPT
# Load private tokens (not in git)
[ -f ~/.secrets/openai.sh ] && source ~/.secrets/openai.sh



# Postgres to project in Rust -- uncamment all line below to work on Rust
# export DATABASE_URL=postgresql://localhost:5432/users

# export DATABASE_URL="postgres://postgres:password@localhost/users"

# export DATABASE_URL=postgres://postgres:password@localhost/tweeter_clone

# Config history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.


# Load Angular CLI autocompletion.
source <(ng completion script)

# pnpm
export PNPM_HOME="/home/tinix/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init --no-rehash -)"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#source ~/powerlevel10k/powerlevel10k.zsh-theme
export PATH=$HOME/.local/bin:$PATH
