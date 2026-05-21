#!/bin/bash

echo "=== 1. Обновляем индексы пакетов apt ==="
sudo apt update

echo "=== 2. Устанавливаем дополнительные пакеты ==="
sudo apt install curl software-properties-common ca-certificates apt-transport-https -y

echo "=== 3. Импортируем GPG-ключ ==="
wget -O- https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null

echo "=== 4. Добавляем репозиторий докера ==="
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "=== 5. В очередной раз обновляем индексы пакетов ==="
sudo apt update

echo "=== 6. Проверяем репозиторий ==="
apt-cache policy docker-ce

echo "=== 7. Устанавливаем Docker ==="
sudo apt install docker-ce -y
sudo systemctl status docker

echo "=== Установка Docker Compose ==="
sudo apt-get install docker-compose -y

echo "========================================"
echo "✅ Установка Docker и Docker Compose завершена!"