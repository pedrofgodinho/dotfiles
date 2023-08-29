#!/bin/bash

# Function to refresh sudo credentials
keep_sudo_alive() {
    while true; do
        sudo -n true
        sleep 600  # Refresh every 10 minutes
        kill -0 $$ || exit
    done &
}

# Run the sudo keep-alive function in the background
keep_sudo_alive

# Base and dependencies
sudo pacman -S --needed --noconfirm base-devel neovim curl git zellij nushell 

# Tools
sudo pacman -S --needed --noconfirm python python-pwntools ghidra gdb 

#sudo pacman -S --needed base-devel
#git clone https://aur.archlinux.org/paru.git
#cd paru
#makepkg -si
#cd ..
#rm -rf paru

# Aur Tools
paru -S --needed --noconfirm python-angr

# Install GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"


kill %1

