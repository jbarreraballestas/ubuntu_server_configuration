# Zona Horaria
<p>sudo timedatectl set-timezone America/Bogota</p>

# Idioma Español

<p>sudo apt install language-pack-es</p>
<p>sudo dpkg-reconfigure locales</p>

# Certbot
<p>sudo snap install core; sudo snap refresh core; sudo snap install --classic certbot; sudo ln -s /snap/bin/certbot /usr/bin/certbot</p>

# Comandos para configurar e instalar software en ubuntu server

# Apache
<p>sudo add-apt-repository ppa:ondrej/php</p>
<p>sudo add-apt-repository ppa:ondrej/apache2</p>
<p>sudo apt install -y apache2 software-properties-common libapache2-mod-fcgid libapache2-mod-php php-common php-bz2 php-curl php-xml php-xmlrpc php-gd php-mysql php-zip php-mbstring php-bcmath php-tokenizer php-sqlite3 unzip php-intl php-xmlrpc php-soap php-xml php-fpm php-imagick php-cli php-json php-uploadprogress</p>
<p>sudo phpenmod mbstring</p>

# Habilitar PHP-FPM
<p>sudo a2enmod proxy_fcgi setenvif && sudo a2enconf php-fpm</p>

# Cambiar version de php cli
<p>sudo update-alternatives --config php</p>

# 

# Agregar el usuario actual al grupo www-data
<p>sudo usermod -a -G www-data $USER</p>

# Permisos de carpeta apache 
<p>sudo chown -R $USER /var/www/html/ (Se recomienda que solo el usuario tenga acceso de edición a los ficheros de configuración)</p>

# Configurar apache
<p>sudo nano /etc/apache2/apache2.conf</p>

<p># Caché para tipos de archivo<p>

<FilesMatch ".(js|css|jpg|jpeg|png|gif|ico|swf|mp4|webm|svg)$">
                Header set Cache-Control "max-age=31536000, public"
                Header unset Last-Modified
                Header unset ETag
</FilesMatch>
  
<p># Sobreescribir rutas url (pretty urls)</p>
<p><Directory /var/www/></p>
<p>        AllowOverride All
<p></Directory></p>


# Probar Configuración Apache
<p>apachectl configtest</p>

# Habilitar modulo rewrite
<p>sudo a2enmod rewrite</p>
<p>sudo systemctl restart apache2</p>

# Jdk - Kit de Desarrollo Java
<p>sudo apt install -y default-jdk</p>

# Composer
<p>php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer</p>
<p>export PATH="$HOME/.config/composer/vendor/bin:$PATH"</p>

# Laravel
<p>composer global require laravel/installer</p>

# Node 16.x
<p>curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && sudo apt install -y nodejs</p>


# Mariadb 10.x repository
sudo apt install software-properties-common -y && sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'

# Para ubuntu 20.04
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.6/ubuntu focal main'

# Para ubuntu 18.04
<p>sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.6/ubuntu bionic main'</p>
<p>sudo apt update && sudo apt install mariadb-server -y && sudo mysql_secure_installation</p>

# Comandos Mysql
<p>sudo mysql</p>
<p>CREATE DATABASE database_name;</p>
<p>CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';</p>
<p>GRANT ALL ON database_name.* TO 'user'@'localhost';</p>

# Phpmyadmin
<p>sudo add-apt-repository ppa:phpmyadmin/ppa (No recomendado en producción pero tiene los últimos cambios)</p>
<p>sudo apt install phpmyadmin -y</p>

<p>https://foratdot.info/como-instalar-mariadb-server-y-phpmyadmin/</p>


# Laravel Permisos de directorio
<p>sudo chown -R $USER:www-data storage/ && sudo chown -R $USER:www-data bootstrap/cache/ && sudo chmod -R 775 storage/ && sudo chmod -R 775 bootstrap/cache/</p>

# Laravel Validación Español
<p>https://github.com/Laraveles/spanish</p>

# Host Virtuales Apache
<p>sudo nano /etc/apache2/sites-available/000-default.conf</p>
<p>sudo systemctl reload apache2</p>
