#!/usr/bin/bash

set -ouo pipefail

IFS=$'\n\t'

# install the optional Command Line Tools subsection of the Xcode IDE
# command-line tools for Xcode
xcode-select --install

# ==================
# Brew Update & Upgrade
# ==================

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# ==================
# Zsh and Antigen
# ==================

brew install zsh
brew install antigen

# =============================
# GNU utils instead of MacOS equivalents
# =============================

brew install coreutils 
brew install findutils # find, locate, updatedb, xargs, g
brew install moreutils # sponge
brew install diffutils
brew install gnu-indent
brew install gnu-sed
brew install ed
brew install gnu-tar
brew install grep
brew install gnu-which
brew install gawk
brew install gzip
brew install watch
brew install gnutls
brew install wget -with-iri # wget with IRI support
brew install curl
brew install make

ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Upgrade old tools on Mac
brew install bash
brew install less

# quality of life tools
brew install tmux
brew install ssh-copy-id
brew install tree
brew install geoip

# GitHub - junegunn/fzf: A command-line fuzzy finder https://github.com/junegunn/fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# mellowcandle/bitwise: Terminal based bit manipulator in ncurses https://github.com/mellowcandle/bitwise
brew install bitwise

# antonmedv/fx: Command-line tool and terminal JSON viewer 🔥 - https://github.com/antonmedv/fx
brew install fx

# jq https://stedolan.github.io/jq/
brew install jq




# ===============================
#  GUI apps from 'brew cask'
# ================================

# Karabiner and key code viewers
#brew install karabiner-elements
#brew install key-codes

# Postman
brew install --cask postman

# Docker
brew install --cask docker

# newmarcel/KeepingYouAwake: Prevents your Mac from going to sleep. - https://github.com/newmarcel/KeepingYouAwake
# Alternative for caffeine/amphetamine
brew install keepingyouawake

# Browsers
brew install --cask google-chrome
brew install --cask firefox
brew install --cask firefox-developer-edition

# Password Manager
brew install --cask 1password
brew install 1password-cli

# Chat/video conference tools
brew install --cask slack

# Terminal
brew install --cask iterm2

# Visual Studio code
brew install --cask visual-studio-code

# Network analyzing tools
brew install --cask wireshark

# Video player
brew install vlc

# Little Snitch
brew install little-snitch
brew install micro-snitch

# alt-tab
brew install --cask alt-tab
