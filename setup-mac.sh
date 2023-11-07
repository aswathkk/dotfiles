#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
  echo "Usage: ./${0}

A script to setup a new Mac
First, ensure you have set XDG_CONDIF_HOME properly
Refer: https://stackoverflow.com/questions/55648312/mac-os-x-mojave-set-environment-variable-permanently
"
  exit
fi

cd "$(dirname "$0")"

check_requirements() {
  if [[ ! -v XDG_CONFIG_HOME ]]; then
    echo "Variable XDG_CONFIG_HOME not set!!!"
    exit 1
  fi
}

install_apps() {
  brew install --cask brave-browser
  brew install --cask visual-studio-code
  brew install --cask slack
  brew install --cask kitty

  brew install tmux
}

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_node() {
  brew install nvm
  nvm install --lts
}

setup_pure_prompt() {
  git clone https://github.com/sindresorhus/pure.git "$XDG_CONFIG_HOME/.pure"
}

install_ohmyzsh () {
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$XDG_CONFIG_HOME/.oh-my-zsh"
  echo "source $XDG_CONFIG_HOME/zsh/zshrc" > "$HOME/.zshrc"
}

install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git "$XDG_CONFIG_HOME/.fzf"
  bash "$XDG_CONFIG_HOME/.fzf/install"
}

main() {
  check_requirements
  install_homebrew
  install_node
  install_ohmyzsh
  setup_pure_prompt
  install_fzf
  install_apps
}

main "$@"