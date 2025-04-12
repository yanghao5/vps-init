#!/bin/bash

# 脚本开始时检查是否有 root 权限
if [ "$(id -u)" -ne 0 ]; then
  echo "请使用 root 权限运行此脚本"
  exit 1
fi

# 如果你过去安装过 docker，先删掉：
echo "正在卸载已有的 Docker 相关包..."
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
  apt-get remove -y $pkg
done

# 安装必需的依赖
echo "正在安装必需的依赖..."
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

echo "Docker 安装完成!"
