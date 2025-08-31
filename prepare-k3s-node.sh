#!/bin/bash
set -euo pipefail

# === Настройки ===
NODE_NAME="$(hostname -s)"       # можно переопределить
NODE_IP="$(hostname -I | awk '{print $1}')"   # первый IP, при необходимости замени вручную

echo ">>> Настройка ноды для k3s"
echo "Имя ноды: $NODE_NAME"
echo "IP ноды:  $NODE_IP"

# === 1. Установка UTC ===
echo ">>> Устанавливаем таймзону UTC"
sudo timedatectl set-timezone UTC

# === 2. Остановка k3s и очистка ===
echo ">>> Останавливаем и чистим старый k3s"
sudo systemctl stop k3s-agent || true
sudo systemctl stop k3s || true
sudo k3s-killall.sh || true

sudo rm -rf /var/lib/rancher/k3s/*
sudo rm -rf /etc/rancher/k3s/*

# === 3. Создание config.yaml ===
echo ">>> Создаём /etc/rancher/k3s/config.yaml"
sudo mkdir -p /etc/rancher/k3s
cat <<EOF | sudo tee /etc/rancher/k3s/config.yaml
node-name: ${NODE_NAME}
node-ip: ${NODE_IP}
EOF

echo ">>> Готово!"
echo "Теперь можно выполнить join:"
echo "  curl -sfL https://get.k3s.io | K3S_URL=https://<MASTER_IP>:6443 K3S_TOKEN=<TOKEN> sh -"
