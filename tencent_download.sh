#!/bin/sh
apt-get update && apt-get install git wget -y
wget https://raw.githubusercontent.com/yanghao5/vpsinit/refs/heads/main/tencent.sh
# ohmyzsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
# nvm
wget https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh
