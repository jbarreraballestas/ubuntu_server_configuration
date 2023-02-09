# Zona Horaria Colombia
```
sudo timedatectl set-timezone America/Bogota
```

# Idioma Español
```
sudo apt install language-pack-es locales-all && sudo locale-gen
```
```
sudo dpkg-reconfigure locales
```
```
sudo update-locale 
```
# Certbot
```
sudo snap install core; sudo snap refresh core; sudo snap install --classic certbot; sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

# PPA for apache and php (Optional)
```
sudo add-apt-repository ppa:ondrej/apache2
sudo add-apt-repository ppa:ondrej/php
```

# Instalar php
```
sudo apt install -y php php-common php-cli php-fpm php-curl php-zip php-xml php-mbstring php-mysql php-gd
```

# Habilitar PHP-FPM Apache
```
sudo a2enmod proxy_fcgi setenvif && sudo a2enconf php-fpm
```

# Cambiar version de php cli
```
sudo update-alternatives --config php
```

# Agregar el usuario actual al grupo www-data
```
sudo usermod -a -G www-data $USER
```
# Instalar nginx
```
sudo apt install nginx -y
```
# Instalar apache
```
sudo apt install apache2 -y
```
# Permisos de carpeta apache 

> (Se recomienda que solo el usuario tenga acceso de edición a los ficheros de configuración)
```
sudo chown -R $USER /var/www/html/
```

# Configurar apache

**Habilitar el modulo header apache**
```
sudo a2enmod headers
```

**Editar archivo de configuración**
```
sudo nano /etc/apache2/apache2.conf
```

**Caché para tipos de archivo**
```
<FilesMatch ".(js|css|jpg|jpeg|png|gif|ico|swf|mp4|webm|svg)$">
    Header set Cache-Control "max-age=31536000, public"
    Header unset Last-Modified
    Header unset ETag
</FilesMatch>
```

**Sobreescribir rutas url (pretty urls)**
```
<Directory /var/www/>
        AllowOverride All
</Directory>
```


# Probar Configuración Apache
```
apachectl configtest
```

# Habilitar modulo rewrite
```
sudo a2enmod rewrite
```
```
sudo systemctl restart apache2
```


# Jdk - Kit de Desarrollo Java
```
sudo apt install -y default-jdk
```

# Composer
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer
```

```
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
```

# Node 18.x
```
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt install -y nodejs
```


# Mariadb 10.x repository key
```
sudo apt install software-properties-common -y && sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
```

# Mariadb 10.x add repository
```
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.10/ubuntu '$(lsb_release -cs)' main'
```

# Instalar mariabd
```
sudo apt update && sudo apt install mariadb-server -y && sudo mysql_secure_installation
```

# Comandos Mysql
```
sudo mysql
```
```
CREATE DATABASE database_name;
```
```
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
```
```
GRANT ALL ON database_name.* TO 'user'@'localhost';
```

# Phpmyadmin repository (No recomendado en producción pero tiene los últimos cambios)
```
sudo add-apt-repository ppa:phpmyadmin/ppa -y
```
# Instalar phpmyadmin
```
sudo apt install phpmyadmin -y
```

**Como instalar y configurar phpmyadmin manualmente** [Foradot mysql y phpmyadmin](https://foratdot.info/como-instalar-mariadb-server-y-phpmyadmin).



# Host Virtuales Apache
```
sudo nano /etc/apache2/sites-available/000-default.conf
```
```
sudo systemctl reload apache2
```
