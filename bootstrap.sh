#!/bin/bash

# Globals
ASWATHKK_DOTFILES=$(dirname "$0")

# Detect OS
# Currently, I'm only using MacOS, Ubuntu and CentOS
function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}
function is_centos() {
  [[ "$(cat /etc/*release 2> /dev/null | grep ^NAME | tr -d 'NAME=\"')" =~ CentOS ]] || return 1
}
function get_os() {
  for os in osx ubuntu centos; do
    is_$os; [[ $? == ${1:-0} ]] && echo $os
  done
}

# Detect Package manager
function get_packman() {
    OS=$(get_os)
    case $OS in
        "ubuntu")
            echo "apt"
            ;;
        "centos")
            echo "yum"
            ;;
        "osx")
            echo "brew"
            ;;
    esac
}

# Install specified package
function install() {
    PACKMAN=$(get_packman)

    if ! type "$1" > /dev/null 2>&1; then
        echo "Installing $1"
        if [[ $PACKMAN == "brew" ]]; then
            brew install $1
        else
            $PACKMAN -y install $1
        fi
    else
        echo "$1 already Installed"
    fi
}

# Install dependencies
install git
install zsh
install tmux
install neovim

# Install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $ASWATHKK_DOTFILES/.oh-my-zsh

# Install Vim-Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

