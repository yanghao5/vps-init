#!/bin/bash
mkdir -p backup/config

# config 
## zsh
cp .zshrc /home/momo/backup/config/
cp .zsh_envs /home/momo/backup/config/
cp .zsh_aliases /home/momo/backup/config/
rsync -rv --exclude 'authorized_keys' /home/momo/.ssh /home/momo/backup/config/ 

## neovim
rsync -rv /home/momo/.config/nvim /home/momo/backup/config/

## git
cp .gitconfig /home/momo/backup/config/

# apps file dev
sudo rsync -rv apps /home/momo/backup/
rsync -rv file /home/momo/backup/ 
sudo rsync -rv dev /home/momo/backup/ 

zip -r backup.zip backup