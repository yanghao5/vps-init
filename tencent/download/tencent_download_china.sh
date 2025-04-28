#!/bin/sh
REMOTE=${REMOTE:-https://ghfast.top/}
apt-get update && apt-get install git wget -y

# rm -rf tencent_root_china.sh restore.sh tencent_user_china.sh nvm.git ohmyzsh_install.sh ohmyzsh.git cmake-3.28.2-linux-x86_64.tar.gz llvm.sh go1.24.2.linux-amd64.tar.gz
wget ${REMOTE}https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/tencent/root/tencent_root_china.sh
wget ${REMOTE}https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/restore.sh
wget ${REMOTE}https://raw.githubusercontent.com/yanghao5/vps-init/refs/heads/main/tencent/user/tencent_user_china.sh

# nvm
git clone --bare ${REMOTE}https://github.com/nvm-sh/nvm.git

# ohmyzsh
wget ${REMOTE}https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O ohmyzsh_install.sh
git clone --bare ${REMOTE}https://github.com/ohmyzsh/ohmyzsh.git

# Cmake 3.28.2
wget ${REMOTE}https://github.com/Kitware/CMake/releases/download/v3.28.2/cmake-3.28.2-linux-x86_64.tar.gz

# LLVM 
wget https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/llvm.sh

# Golang 1.24.2
wget https://go.dev/dl/go1.24.2.linux-amd64.tar.gz