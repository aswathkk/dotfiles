# My Dotfiles

Dotfiles setup for MacOS

## Installation

Make sure XDG_CONFIG_HOME variable is set.
Make zsh to source our `zshrc`:

``` shell
echo "source $XDG_CONFIG_HOME/zsh/zshrc" > ~/.zshrc
```

Run the setup file. Read through the script before running, because it contains installation of applications & utils that I use. You may comment out some steps if you don't need them.

``` shell
bash setup-mac.sh
```

## Apps

Terminal: Kitty
