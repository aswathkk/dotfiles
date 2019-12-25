#!/bin/bash

function mcd() {
    mkdir -p "$1" && cd "$1"
}

# Copy from remote tmux buffer to local clipboard
function cpb {
    ssh "$1" "tmux saveb -" | xclip -sel c
}

# Copy from remote tmux buffer to local tmux clipboard
function cpt {
    ssh "$1" "tmux saveb -" | tmux loadb -
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

alias d='docker'
alias dc='docker-compose'
alias k='kubectl'
