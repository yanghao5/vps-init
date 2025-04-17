#!/bin/bash

mkdir -p backup/config

# config 
## zsh
cp .zshrc /home/hall/backup/config/
cp .zsh_envs /home/hall/backup/config/
cp .zsh_aliases /home/hall/backup/config/
rsync -rv --exclude 'authorized_keys' /home/hall/.ssh /home/hall/backup/config/ 

## neovim
rsync -rv /home/hall/.config/nvim /home/hall/backup/config/

## git
cp .gitconfig /home/hall/backup/config/

# apps file dev
rsync -rv apps /home/hall/backup/
rsync -rv file /home/hall/backup/ 
rsync -rv dev /home/hall/backup/ 

tar -czvf backup.tar.gz backup