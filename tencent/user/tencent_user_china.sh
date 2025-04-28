#!/bin/sh

# nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone /home/hall/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

# go 1.24.2
sudo tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz


## LLVM
sudo apt-get install lsb-release wget software-properties-common gnupg -y

sudo ./llvm.sh 17 all -m https://mirrors.tuna.tsinghua.edu.cn/llvm-apt

## cmake
sudo tar -C /opt -xzf cmake-3.28.2-linux-x86_64.tar.gz

sudo apt autoremove -y