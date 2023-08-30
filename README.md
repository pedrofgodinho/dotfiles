
# Dotfiles
These are my dotfiles for pwn and reverse engineering. I run nushell as a shell, zellij as a terminal multiplexer, and lunarvim as a text editor. This repository is currently very, very barebones. Most tools are on the default configuration.

# Installing
If on an arch-based system, `.install/install.sh` will install all the tools these dotfiles configure and setup the dotfiles. This can and will overwrite files if you already have configurations setup for the same tools! 
Check `.install/install.sh` and make sure you don't have any files in your home directory that conflict with the ones in this repository before running.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/pedrofgodinho/dotfiles/main/.install/install.sh)"
```
