#!/bin/sh

# install 
bash nvm_install.sh 
sudo tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz


## LLVM
sudo apt-get install lsb-release wget software-properties-common gnupg -y
sudo ./llvm.sh 17 all
## cmake
sudo tar -C /opt -xzf cmake-3.28.2-linux-x86_64.tar.gz

## gh
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

# delete files
rm llvm.sh nvm_install.sh ohmyzsh_install.sh restore.sh tencent_user.sh
rm cmake-3.28.2-linux-x86_64.tar.gz
rm go1.24.2.linux-amd64.tar.gz
rm backup.tar.gz
sudo rm backup/ -rf
