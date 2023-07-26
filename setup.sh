#!/usr/bin/env bash

mkdir -p ~/.ssh/config.d

mkdir -p ~/.zsh

mkdir -p ~/.config

# starship
ln -sf $HOME/code/dotfiles/starship.toml $HOME/.config/starship.toml

# zshrc
ln -sf $HOME/code/dotfiles/.zshrc $HOME/.zshrc

# setup ssh-config
ln -sf $HOME/code/dotfiles/ssh-config $HOME/.ssh/config
ln -sf $HOME/code/dotfiles/private/ssh-config $HOME/.ssh/config.d/private
ln -sf $HOME/code/dotfiles/baffinbay/ssh-config $HOME/.ssh/config.d/baffinbay

