#!/bin/bash

# 脚本开始时检查是否有 root 权限
if [ "$(id -u)" -ne 0 ]; then
  echo "请使用 root 权限运行此脚本"
  exit 1
fi

# swap mem 4G
dd if=/dev/zero of=/swapfile bs=1G count=4
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
sysctl vm.swappiness=90


# install 
apt-get update && apt-get install sudo wget curl neovim git btop zsh rsync jq -y

# add user momo proxy jumper
adduser --disabled-password --gecos "" momo
adduser --disabled-password --gecos "" lain
adduser --disabled-password --gecos "" jumper
# 给 root 权限
usermod -aG sudo momo
echo "%sudo   ALL=(ALL:ALL) ALL" | tee -a /etc/sudoers

# set passwd
echo "root:op" | chpasswd
echo "momo:op" | chpasswd

# SHH
echo "Port 80" | tee -a /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" | tee -a /etc/ssh/sshd_config
echo "AuthorizedKeysFile .ssh/authorized_keys" | tee -a /etc/ssh/sshd_config
echo "Match User lain" | tee -a /etc/ssh/sshd_config
echo "  PasswordAuthentication yes" | tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

## momo ssh key
mkdir -p /home/momo/.ssh
cp /root/.ssh/authorized_keys /home/momo/.ssh
chown -R momo:momo /home/momo/.ssh
chmod 700 /home/momo/.ssh
chmod 600 /home/momo/.ssh/authorized_keys

## jumper ssh key
mkdir -p /home/jumper/.ssh
cp /root/.ssh/authorized_keys /home/jumper/.ssh
chown -R jumper:jumper /home/jumper/.ssh
chmod 700 /home/jumper/.ssh
chmod 600 /home/jumper/.ssh/authorized_keys

# Docker
sh ./get-docker.sh

## 给 momo 用户执行 docker 权限
usermod -aG docker momo

# install files

# shell scripts
chmod +x restore.sh user.sh
chown momo:momo restore.sh user.sh
mv restore.sh /home/momo
mv user.sh /home/momo

#ohmyzsh
chmod +x ohmyzsh_install.sh
chown momo:momo ohmyzsh_install.sh
mv ohmyzsh_install.sh /home/momo

#nvm
chmod +x nvm_install.sh
chown momo:momo nvm_install.sh
mv nvm_install.sh /home/momo

# Cmake
chown momo:momo cmake-3.28.2-linux-x86_64.tar.gz
mv cmake-3.28.2-linux-x86_64.tar.gz /home/momo

# LLVM
chown momo:momo llvm.sh
chmod +x llvm.sh
mv llvm.sh /home/momo

# Golang
chown momo:momo go1.24.2.linux-amd64.tar.gz
mv go1.24.2.linux-amd64.tar.gz /home/momo
