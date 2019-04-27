export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$ASWATHKK_DOTFILES/.oh-my-zsh
export EDITOR=nvim
export GIT_EDITOR=nvim
export MANPAGER="nvim -c MANPAGER -"
export XDG_CONFIG_HOME=$ASWATHKK_DOTFILES
export TERM=xterm-256color

# Golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export GOPATH=$HOME/go

ZSH_THEME="gnzh"

plugins=(
    git
    docker
)

source $ZSH/oh-my-zsh.sh

alias tmux='tmux -u -f "$XDG_CONFIG_HOME"/tmux/.tmux.conf'
alias whatsmyip='curl http://ipinfo.io/ip'

source $XDG_CONFIG_HOME/util_scripts/*

