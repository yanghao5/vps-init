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

# delete files
cd ~
rm llvm.sh nvm_install.sh ohmyzsh_install.sh tencent_user.sh
rm cmake-3.28.2-linux-x86_64.tar.gz
rm go1.24.2.linux-amd64.tar.gz
rm backup.tar.gz
sudo rm backup/ -rf
