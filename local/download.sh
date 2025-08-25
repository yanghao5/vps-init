#!/bin/sh
ture > /etc/apt/sources.list
wget https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/local/debian.sources
mv debian.sources /etc/apt/sources.list.d/

apt-get update && apt-get install sudo git -y

# restore
wget https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/restore.sh
# root
wget https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/local/root.sh
# user
wget https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/local/user.sh

# docker
wget https://get.docker.com -O get-docker.sh 

# ohmyzsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O ohmyzsh_install.sh

# nvm
wget https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh -O nvm_install.sh

# Cmake 3.28.2
wget https://github.com/Kitware/CMake/releases/download/v3.28.2/cmake-3.28.2-linux-x86_64.tar.gz

# LLVM 
wget https://apt.llvm.org/llvm.sh

# Golang 1.24.2
wget https://go.dev/dl/go1.24.2.linux-amd64.tar.gz
