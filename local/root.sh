#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "请使用 root 权限运行此脚本"
  exit 1
fi

apt-get update && apt-get install sudo wget curl neovim git btop zsh rsync jq -y

# hall
usermod -aG sudo hall

# Docker
sh ./get-docker.sh

## 给 hall 用户执行 docker 权限
usermod -aG docker hall

# hall install files

# shell scripts
chmod +x restore.sh user.sh
chown hall:hall restore.sh user.sh
mv restore.sh /home/hall
mv user.sh /home/hall

#ohmyzsh
chmod +x ohmyzsh_install.sh
chown hall:hall ohmyzsh_install.sh
mv ohmyzsh_install.sh /home/hall

#nvm
chmod +x nvm_install.sh
chown hall:hall nvm_install.sh
mv nvm_install.sh /home/hall

# Cmake
chown hall:hall cmake-3.28.2-linux-x86_64.tar.gz
mv cmake-3.28.2-linux-x86_64.tar.gz /home/hall

# LLVM
chown hall:hall llvm.sh
chmod +x llvm.sh
mv llvm.sh /home/hall

# Golang
chown hall:hall go1.24.2.linux-amd64.tar.gz
mv go1.24.2.linux-amd64.tar.gz /home/hall

# env
echo "export PATH=$PATH:/usr/sbin" | tee -a .bashrc
