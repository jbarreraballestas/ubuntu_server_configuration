# Idioma Español

<p>sudo apt install language-pack-es</p>
<p>sudo dpkg-reconfigure locales</p>

# Comandos para configurar e instalar software en ubuntu server

# Apache
<p>sudo add-apt-repository ppa:ondrej/php</p>
<p>sudo add-apt-repository ppa:ondrej/apache2</p>
<p>sudo apt install -y apache2 software-properties-common libapache2-mod-fcgid libapache2-mod-php php-bz2 php-curl php-gd php-mysql php-zip php-mbstring php-bcmath php-tokenizer php-sqlite3 unzip php-intl php-xmlrpc php-soap php-xml php-fpm</p>


# Agregar AllowOverride All a la carpeta www
<p>sudo nano /etc/apache2/apache2.conf</p>

# Habilitar modulo rewrite
<p>sudo a2enmod rewrite</p>
<p>sudo systemctl restart apache2</p>

# User to group
<p>sudo usermod -a -G www-data $USER</p>



# Jdk
<p>sudo apt install -y default-jdk</p>

# Composer
<p>php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer</p>


# Node 16.x

<p>curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && sudo apt install -y nodejs</p>


# Mariadb 10.x repository

sudo apt install software-properties-common -y && sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
# Para ubuntu 20.04

sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.6/ubuntu focal main'
# Para ubuntu 18.04
<p>sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.6/ubuntu bionic main'</p>
<p>sudo apt update && sudo apt install mariadb-server -y</p>

# Mysql Commands

<p>sudo mysql</p>
<p>CREATE DATABASE database_name;</p>
<p>CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';</p>
<p>GRANT ALL ON database_name.* TO 'user'@'localhost';</p>

# Phpmyadmin

sudo apt install phpmyadmin -y

# Permisos de carpeta apache 
<p>sudo chown -R $USER /var/www/html/</p>

# Laravel Permisos de directorio
<p>sudo chown -R $USER:www-data storage/ && sudo chown -R $USER:www-data bootstrap/cache/ && sudo chmod -R 775 storage/ && sudo chmod -R 775 bootstrap/cache/</p>

# Host Virtuales Apache

<p>sudo nano /etc/apache2/sites-available/000-default.conf</p>
<p>sudo systemctl reload apache2</p>
