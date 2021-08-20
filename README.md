# Idioma Español

<p>sudo apt install language-pack-es</p>
<p>sudo dpkg-reconfigure locales</p>

# Comandos para configurar e instalar software en ubuntu server

# Apache

<p>sudo apt install -y apache2 libapache2-mod-php php-bz2 php-curl php-gd php-mysql php-zip php-mbstring php-bcmath php-tokenizer php-sqlite3 unzip php-intl php-xmlrpc php-soap php-xml</p>


# Agregar AllowOverride All a la carpeta www
<p>sudo nano /etc/apache2/apache2.conf</p>

# Habilitar modulo rewrite
<p>sudo a2enmod rewrite</p>
<p>sudo systemctl restart apache2</p>

# User to group
<p>sudo usermod -a -G www-data $USER</p>

# Jdk
<p>sudo apt install -y default-jdk</p>

# Node 16.x

<p>curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && sudo apt install -y nodejs</p>


# Mariadb 10.5 repository

sudo apt install software-properties-common -y && sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
# Para ubuntu 20.04

sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.5/ubuntu focal main'
# Para ubuntu 18.04
<p>sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.5/ubuntu bionic main'</p>
<p>sudo apt update && sudo apt install mariadb-server -y</p>

# Mysql Commands

<p>sudo mysql</p>
<p>CREATE DATABASE database_name;</p>
<p>CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';</p>
<p>GRANT ALL ON database_name.* TO 'user'@'localhost';</p>

# Phpmyadmin

sudo apt install phpmyadmin -y

# Composer

<p>wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet</p>
<p>sudo mv composer.phar /usr/bin/composer

# Permisos de carpeta apache 
<p>sudo chown -R $USER /var/www/html/</p>

# Laravel Permisos de directorio
<p>sudo chown -R $USER:www-data storage/ && sudo chown -R $USER:www-data bootstrap/cache/ && sudo chmod -R 775 storage/ && sudo chmod -R 775 bootstrap/cache/</p>

# Host Virtuales Apache

<p>sudo nano /etc/apache2/sites-available/000-default.conf</p>
<p>sudo systemctl reload apache2</p>
