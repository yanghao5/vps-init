#!/bin/sh
REMOTE=${REMOTE:-https://gh-proxy.com/}
apt-get update && sudo apt-get install git wget -y

# script
wget ${REMOTE}https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/tencent/china/root.sh
wget ${REMOTE}https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/tencent/china/restore.sh
wget ${REMOTE}https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/tencent/china/user.sh

# nvm
git clone --bare --depth=1 ${REMOTE}https://github.com/nvm-sh/nvm.git

# ohmyzsh
wget ${REMOTE}https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O ohmyzsh_install.sh
git clone --bare --depth=1 ${REMOTE}https://github.com/ohmyzsh/ohmyzsh.git

# LLVM 
wget https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/llvm.sh

# Golang 1.24.2
wget https://go.dev/dl/go1.24.2.linux-amd64.tar.gz

# Cmake 3.28.2
wget ${REMOTE}https://github.com/Kitware/CMake/releases/download/v3.28.2/cmake-3.28.2-linux-x86_64.tar.gz