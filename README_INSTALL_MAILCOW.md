# 1. Создаём папку и переходим в неё
sudo mkdir -p /opt/mailcow-dockerized
cd /opt/mailcow-dockerized

# 2. Клонируем официальный репозиторий
git clone https://github.com/mailcow/mailcow-dockerized .
# (точка в конце важна — клонирует в текущую папку)

# 3. Генерируем конфигурацию (самый важный шаг)
./generate_config.sh

# Отключаем встроенный Let's Encrypt — сертификаты будет выдавать Caddy
SKIP_LETS_ENCRYPT=y

# Отключаем принудительный HTTPS-редирект внутри Mailcow
HTTP_REDIRECT=n                   # ← очень важно!

# nginx-mailcow будет слушать только локально на другом порту
HTTP_BIND=127.0.0.1
HTTP_PORT=9000                    # ← можно 8081, 9000 или любой свободный (не 8080!)

# HTTPS внутри Mailcow можно отключить или оставить
HTTPS_BIND=127.0.0.1
HTTPS_PORT=8443

docker compose pull
docker compose up -d