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

# 卸载腾讯云监控
#/usr/local/qcloud/stargate/admin/uninstall.sh
#/usr/local/qcloud/YunJing/uninst.sh
#/usr/local/qcloud/monitor/barad/admin/uninstall.sh

# install 
apt-get update && apt-get install sudo wget curl neovim git btop zsh rsync -y

# add user momo proxy jumper
adduser --disabled-password --gecos "" momo
adduser --disabled-password --gecos "" proxy
adduser --disabled-password --gecos "" jumper
# root permisson
usermod -aG sudo momo
echo "%sudo   ALL=(ALL:ALL) ALL" |  tee -a /etc/sudoers

# set password
echo "root:op" | chpasswd
echo "momo:op" | chpasswd

# SHH
echo "PubkeyAuthentication yes" | tee -a /etc/ssh/sshd_config
echo "AuthorizedKeysFile .ssh/authorized_keys" | tee -a /etc/ssh/sshd_config
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


# docker
echo "正在卸载已有的 Docker 相关包..."
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
  apt-get remove -y $pkg
done

# 安装必需的依赖
apt-get update && apt-get install -y ca-certificates curl gnupg

# 创建 apt 密钥目录并设置权限
echo "正在创建 apt 密钥目录..."
install -m 0755 -d /etc/apt/keyrings

# 使用阿里云提供的 GPG 密钥
echo "正在下载 Docker 的 GPG 密钥..."
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 修改密钥文件的权限
chmod a+r /etc/apt/keyrings/docker.gpg

# 添加 Docker 官方源（使用清华源）
echo "正在添加 Docker 官方源..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# 更新 apt 包索引
echo "正在更新 apt 包索引..."
apt-get update

# 安装 Docker 相关包
echo "正在安装 Docker 和相关工具..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 给 momo 用户执行 docker 权限
usermod -aG docker momo

# 配置 Docker 镜像加速器
echo "正在配置 Docker 镜像加速器..."
tee /etc/docker/daemon.json <<EOF
{
   "registry-mirrors": [
   "https://mirror.ccs.tencentyun.com"
  ]
}
EOF

# 重载 systemd 配置并重启 Docker 服务
echo "正在重载 Docker 配置并重启 Docker 服务..."
systemctl daemon-reload
systemctl restart docker

# shell scripts
chmod +x restore.sh tencent_user_china.sh
chown momo:momo restore.sh tencent_user_china.sh
mv restore.sh /home/momo
mv tencent_user_china.sh /home/momo

# nvm
chown -R momo:momo nvm.git
chmod 700 -R nvm.git
mv  nvm.git /home/momo

# oh my zsh
chown -R momo:momo ohmyzsh.git
chmod 700 -R ohmyzsh.git
mv  ohmyzsh.git /home/momo

chmod +x ohmyzsh_install.sh
chown momo:momo ohmyzsh_install.sh
mv ohmyzsh_install.sh /home/momo

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
