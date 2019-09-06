export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$ASWATHKK_DOTFILES/.oh-my-zsh
export EDITOR=nvim
export GIT_EDITOR=nvim
export MANPAGER="nvim -c MANPAGER -"
export XDG_CONFIG_HOME=$ASWATHKK_DOTFILES
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8

# Golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

plugins=(
    git
    docker
)

source $ZSH/oh-my-zsh.sh

source <(cat $XDG_CONFIG_HOME/util_scripts/*)

autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
