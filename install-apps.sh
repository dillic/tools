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

# Install Neovim - pre-compiled version
install_precompiled() {
    echo "Installing pre-compiled version..."
    curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
    tar xzvf nvim-linux-x86_64.tar.gz
    sudo cp -f -r nvim-linux-x86_64/* /usr/local/
    rm -rf nvim-linux-x86_64.tar.gz nvim-linux-x86_64
}
install_precompiled

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
