# Comandos para configurar e instalar software en ubuntu server

# Apache

sudo apt install -y apache2 libapache2-mod-php php-bz2 php-curl php-gd php-mysql php-zip php-mbstring php-bcmath php-tokenizer php-sqlite3 unzip php-intl php-xmlrpc php-soap


# Agregar AllowOverride All a la carpeta www
sudo nano /etc/apache2/apache2.conf

# User to group
sudo usermod -a -G www-data $USER

# Jdk
sudo apt install -y default-jdk

# Node 16.x

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && sudo apt install -y nodejs


# Mariadb 10.5 repository

sudo apt install software-properties-common -y
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
# Para ubuntu 20.04

sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.5/ubuntu focal main'
# Para ubuntu 18.04
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.5/ubuntu bionic main'
sudo apt update && sudo apt install mariadb-server -y

# Mysql Commands

sudo mysql
CREATE DATABASE database_name;
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON database_name.* TO 'user'@'localhost';

# Phpmyadmin

sudo apt install phpmyadmin -y

# Composer

wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
sudo mv composer.phar /usr/bin/composer

# Permisos de carpetas

sudo chown -R $USER /var/www/html/
sudo chmod -R 775 alejo/storage
sudo chmod -R 775 alejo/bootstrap/cache
sudo chown -R www-data alejo/storage
sudo chown -R www-data alejo/bootstrap/cache

# Host Virtuales Apache

sudo nano /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2

