#!/bin/bash

sudo timedatectl set-timezone America/Bogota

sudo apt update

sudo apt upgrade -y

sudo snap install core; sudo snap refresh core; sudo snap install --classic certbot; sudo ln -s /snap/bin/certbot /usr/bin/certbot

sudo apt install ca-certificates apt-transport-https software-properties-common -y

sudo add-apt-repository ppa:ondrej/php -y

sudo add-apt-repository ppa:ondrej/apache2 -y

sudo apt install -y libapache2-mod-fcgid libapache2-mod-php php-common php-bz2 php-curl php-xml php-xmlrpc php-gd php-mysql php-zip php-mbstring php-bcmath php-tokenizer php-sqlite3 unzip php-intl php-xmlrpc php-soap php-xml php-fpm php-imagick php-cli php-json php-uploadprogress apache2

sudo a2enmod proxy_fcgi setenvif && sudo a2enconf php8.1-fpm

sudo usermod -a -G www-data $USER

sudo chown -R $USER /var/www/

sudo a2enmod headers

sudo a2enmod rewrite

sudo systemctl restart apache2

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer

export PATH="$HOME/.config/composer/vendor/bin:$PATH"

#composer global require laravel/installer

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && sudo apt install -y nodejs

sudo apt install software-properties-common -y && sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'

sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.8/ubuntu $(lsb_release -cs) main'

sudo apt update && sudo apt install mariadb-server -y && sudo mysql_secure_installation












