#!/usr/bin/env bash

DOTFILES_DIR=${DOTFILES_DIR}

mkdir -p ~/.ssh/config.d

mkdir -p ~/.zsh

mkdir -p ~/.config

mkdir -p ~/.tmux/plugins

mkdir -p ~/.config/yabai
mkdir -p ~/.config/skhd


# starship
ln -sf ${DOTFILES_DIR}/zsh/starship.toml $HOME/.config/starship.toml

# zshrc
ln -sf ${DOTFILES_DIR}/.zshrc $HOME/.zshrc

# yabai
ln -sf ${DOTFILES_DIR}/yabairc $HOME/.config/yabai/yabairc

# skhd
ln -sf ${DOTFILES_DIR}/skhdrc $HOME/.config/skhd/skhdrc

# setup ssh-config
ln -sf ${DOTFILES_DIR}/ssh-config $HOME/.ssh/config
ln -sf ${DOTFILES_DIR}/private/ssh-config $HOME/.ssh/config.d/private
ln -sf ${DOTFILES_DIR}/baffinbay/ssh-config $HOME/.ssh/config.d/baffinbay

# tmux
ln -sf ${DOTFILES_DIR}/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf ${DOTFILES_DIR}/tmux/renew_env.sh $HOME/.tmux/renew_env.sh
ln -sf ${DOTFILES_DIR}/tmux/.tmux-cht-command $HOME/.tmux/.tmux-cht-command
ln -sf ${DOTFILES_DIR}/tmux/.tmux-cht-languages $HOME/.tmux/.tmux-cht-languages

# nvim
ln -sf ${DOTFILES_DIR}/nvim $HOME/.config/nvim
