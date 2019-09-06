#!/bin/bash

function mcd() {
    mkdir -p "$1" && cd "$1"
}

# Alias
alias tmux='tmux -u -f "$XDG_CONFIG_HOME"/tmux/.tmux.conf'
alias whatsmyip='curl http://ipinfo.io/ip'

alias l='ls -lrth'

alias v='nvim'

alias g='git'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gl='git log'
