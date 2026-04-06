# 1. Обновляем индексы пакетов apt
 
 sudo apt update

# 2. Устанавливаем дополнительные пакеты

sudo apt install curl software-properties-common ca-certificates apt-transport-https -y

# 3. Импортируем GPG-ключ

wget -O- https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null

# 4. Добавляем репозиторий докера

echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable"| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. В очередной раз обновляем индексы пакетов

sudo apt update

# 6. Проверяем репозиторий

apt-cache policy docker-ce

# 7. Устанавливаем докер

sudo apt install docker-ce -y

sudo systemctl status docker

# Установка Docker Compose

sudo apt-get install docker-compose


