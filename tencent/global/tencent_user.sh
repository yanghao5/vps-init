#!/bin/sh

# go 1.24.2
sudo tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz

# LLVM 17
sudo apt-get install lsb-release wget software-properties-common gnupg -y
sudo ./llvm.sh 17 all -m https://mirrors.tuna.tsinghua.edu.cn/llvm-apt

## cmake
sudo tar -C /opt -xzf cmake-3.28.2-linux-x86_64.tar.gz
