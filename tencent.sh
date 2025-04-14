#!/bin/bash

# 脚本开始时检查是否有 root 权限
if [ "$(id -u)" -ne 0 ]; then
  echo "请使用 root 权限运行此脚本"
  exit 1
fi

echo "安装必备软件"
apt-get update && apt-get install wget curl neovim git btop ufw zsh rsync -y

echo "创建新用户 hall"
adduser --disabled-password --gecos "" hall
echo "给 root 权限"
usermod -aG sudo hall
echo "%sudo   ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers

echo "设置密码"
echo "root:op" | chpasswd
echo "hall:op" | chpasswd

# SHH
echo "PubkeyAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
echo "AuthorizedKeysFile .ssh/authorized_keys" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

# Docker
wget https://get.docker.com -O get-docker.sh 
sh ./get-docker.sh

echo "Docker 安装完成!"
