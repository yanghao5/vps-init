#!/bin/bash

tar -xzvf backup.tar.gz
cd backup

# config 
cd config
mv .zshrc /home/hall/
mv .zsh_envs /home/hall/
mv .zsh_aliases /home/hall/
mv .ssh/* /home/hall/.ssh

## neovim
mkdir -p /home/hall/.config/nvim 
rsync -rv nvim/ /home/hall/.config/nvim 

## git
cp .gitconfig /home/hall/

# apps file dev
cd ..
rsync -rv apps /home/hall/
rsync -rv file /home/hall/
rsync -rv dev /home/hall/
