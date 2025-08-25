#!/bin/sh

# nvm
bash nvm_install.sh

# go 1.24.2
sudo tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz

# LLVM 17
sudo apt-get install lsb-release wget software-properties-common gnupg -y
sudo ./llvm.sh 17 all

## cmake
sudo tar -C /opt -xzf cmake-3.28.2-linux-x86_64.tar.gz

# env
echo "export PATH=$PATH:/usr/sbin" | tee -a .bashrc