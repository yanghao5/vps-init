#!/bin/bash

# config 
cd config
mv .zshrc /home/momo/
mv .zsh_envs /home/momo/
mv .zsh_aliases /home/momo/
mv .ssh/* /home/momo/.ssh

## neovim
mkdir -p /home/momo/.config/nvim 
rsync -rv nvim/ /home/momo/.config/nvim 

## git
cp .gitconfig /home/momo/

# apps file dev
cd ..
rsync -rv apps /home/momo/
rsync -rv file /home/momo/
rsync -rv dev /home/momo/
