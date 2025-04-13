#!/bin/sh
REMOTE=${REMOTE:-https://ghfast.top/}
apt-get update && apt-get install git wget -y
wget ${REMOTE}https://raw.githubusercontent.com/yanghao5/vpsinit/refs/heads/main/tencent_china.sh
git clone --bare ${REMOTE}https://github.com/ohmyzsh/ohmyzsh.git
wget ${REMOTE}https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
