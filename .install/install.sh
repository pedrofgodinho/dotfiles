#!/bin/bash

# Function to refresh sudo credentials
keep_sudo_alive() {
    while true; do
        sudo -n true
        sleep 90  # Refresh every 90 seconds
        kill -0 $$ || exit
    done &
}

# Run the sudo keep-alive function in the background
keep_sudo_alive

# Update system
sudo pacman -Syu --noconfirm

# Base and dependencies
sudo pacman -S --needed --noconfirm base-devel neovim curl git unzip nushell rustup python-neovim
rustup default stable

# Tools
sudo pacman -S --needed --noconfirm python python-pwntools ghidra gdb 

# Ui
sudo pacman -S --needed --noconfirm alacritty

# Rust tools 
cargo install --locked zellij

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru

# Aur Tools
paru -S --needed --noconfirm python-angr volta-bin 

# Node
volta install node
volta setup
source .bashrc

# Lunar vim 
echo -e "y\nn\ny" | LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

# Install GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# Clone the repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
git clone --bare https://github.com/pedrofgodinho/dotfiles.git $HOME/.dotfiles
dotfiles stash
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

kill %1

