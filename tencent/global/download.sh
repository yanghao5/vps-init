#!/bin/sh
apt-get update && apt-get install git wget -y

wget https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/tencent/root/tencent_root.sh
wget https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/restore.sh
wget https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/tencent/user/tencent_user.sh

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
