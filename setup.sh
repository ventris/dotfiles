#!/usr/bin/env bash

mkdir -p ~/.ssh/config.d

mkdir -p ~/.zsh

mkdir -p ~/.config

mkdir -p ~/.tmux/plugins

mkdir -p ~/.config/yabai
mkdir -p ~/.config/skhd


# starship
ln -sf $HOME/code/dotfiles/zsh/starship.toml $HOME/.config/starship.toml

# zshrc
ln -sf $HOME/code/dotfiles/.zshrc $HOME/.zshrc

# yabai
ln -sf $HOME/code/dotfiles/yabairc $HOME/.config/yabai/yabairc

# skhd
ln -sf $HOME/code/dotfiles/skhdrc $HOME/.config/skhd/skhdrc

# setup ssh-config
ln -sf $HOME/code/dotfiles/ssh-config $HOME/.ssh/config
ln -sf $HOME/code/dotfiles/private/ssh-config $HOME/.ssh/config.d/private
ln -sf $HOME/code/dotfiles/baffinbay/ssh-config $HOME/.ssh/config.d/baffinbay

# tmux
ln -sf $HOME/code/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/code/dotfiles/tmux/renew_env.sh $HOME/.tmux/renew_env.sh
ln -sf $HOME/code/dotfiles/tmux/.tmux-cht-command $HOME/.tmux/.tmux-cht-command
ln -sf $HOME/code/dotfiles/tmux/.tmux-cht-languages $HOME/.tmux/.tmux-cht-languages


