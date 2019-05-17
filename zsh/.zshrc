export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$ASWATHKK_DOTFILES/.oh-my-zsh
export EDITOR=nvim
export GIT_EDITOR=nvim
export MANPAGER="nvim -c MANPAGER -"
export XDG_CONFIG_HOME=$ASWATHKK_DOTFILES
export TERM=xterm-256color

# Golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

ZSH_THEME="gnzh"

plugins=(
    git
    docker
)

source $ZSH/oh-my-zsh.sh

alias tmux='tmux -u -f "$XDG_CONFIG_HOME"/tmux/.tmux.conf'
alias whatsmyip='curl http://ipinfo.io/ip'

source <(cat $XDG_CONFIG_HOME/util_scripts/*)

