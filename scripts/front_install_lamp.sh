#!/bin/bash
 
# Para mostrar los comandos que se van ejecutando
set -ex

# Actualizamos la lista de repositorios
 apt update
# Actualizamos los paquetes del sistema
# apt upgrade -y

# Instalamos el servidor APACHE
sudo apt install apache2 -y

# Instalar php y paquetes
sudo apt install php libapache2-mod-php php-mysql php-xml php-mbstring php-curl php-zip php-gd php-intl php-soap -y

# Cambiamos parametros de configuración
sed -i "s/;max_input_vars = 1000/max_input_vars = 5000/" /etc/php/8.1/apache2/php.ini

sed -i "s/;max_input_vars = 1000/max_input_vars = 5000/" /etc/php/8.1/cli/php.ini

# Copiamos archivo de configuracion de apache
cp ../conf/000-default.conf /etc/apache2/sites-available


#Reiniciamos servicio apache
systemctl restart apache2

# Cambiamos usuario y propietario de var/www/html

chown -R www-data:www-data /var/www/html