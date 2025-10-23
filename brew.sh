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

# Editor of choice
brew install neovim

brew install openssh
brew install grep

# command line http and api test client
brew install httpie

# ======================
#  Languages
# ======================
# Golang
brew install golang

# NodeJS and npm alternative
brew tap oven-sh/bun
brew install bun

# ======================
#  CTF tols
# ======================
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz
brew install burp-suite

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
brew install wget
brew install curl
brew install make

# 1password-cli tool
brew install 1password-cli

# ===============================
#  GUI apps from 'brew cask'
# ================================

# Postman
brew install --cask postman

# podman
#brew install --cask podman

# newmarcel/KeepingYouAwake: Prevents your Mac from going to sleep. - https://github.com/newmarcel/KeepingYouAwake
# Alternative for caffeine/amphetamine
brew install --cask keepingyouawake

# Browsers
#brew install --cask google-chrome
brew install --cask firefox

# Password Manager
brew install --cask 1password

# Chat/video conference tools
brew install --cask slack

# Terminal
brew install --cask iterm2

# Visual Studio code
brew install --cask visual-studio-code

# Network analyzing tools
brew install --cask wireshark

# Video player
#brew install --cask vlc

# Little Snitch
#brew install --cask little-snitch
#brew install --cask micro-snitch

# alt-tab
#brew install --cask alt-tab


# ===============================
# Hashicorp tools
# ================================
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install hashicorp/tap/vault


# ===============================
# Pomerium
# ================================
#brew tap pomerium/tap
#brew install pomerium/tap/pomerium-cli

#brew install gh
