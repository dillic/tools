#!/bin/bash

# This script is used to install a basic set of tools and packages on a new Debian/Ubuntu system.
# It includes the installation of common utilities, development tools, and other useful software.
# Update the package list
sudo apt update
# Upgrade installed packages
sudo apt upgrade -y
# Install common utilities
sudo apt install -y \
    curl \
    wget \
    git \
    vim \
    htop \
    build-essential \
    net-tools \
    tree \
    zip \
    unzip \
    jq \
    python3-pip \
    python3-venv \
    fzf \
    ripgrep \
    bat \
    exa \
    fd-find \
    mc \
    btop

# Install Neovim from PPA
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install -y neovim

# Install LazyVIM Neovim configuration
if [ -d ~/.config/nvim ]; then
    echo "Neovim configuration already exists. Backing up..."
    mv ~/.config/nvim{,.bak}
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}
else
    echo "No existing Neovim configuration found. Continuing..."
fi

cd ~
mkdir -p ~/.config
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

exit 0
