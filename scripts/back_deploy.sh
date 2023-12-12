#!/bin/bash
 
# Para mostrar los comandos que se van ejecutando
set -ex

# Actualizamos la lista de repositorios
 apt update

# Importamos variables de configuracion
source .env

# Creamos base de datos y usuario para wordpress
mysql -u root<<<"DROP DATABASE IF EXISTS $MOODLE_DB_NAME"
mysql -u root<<<"CREATE DATABASE $MOODLE_DB_NAME"
mysql -u root<<<"DROP USER IF EXISTS $MOODLE_DB_USER@$IP_CLIENTE_MYSQL"
mysql -u root<<<"CREATE USER $MOODLE_DB_USER@$IP_CLIENTE_MYSQL IDENTIFIED BY '$MOODLE_DB_PASS'"
mysql -u root<<<"GRANT ALL PRIVILEGES ON $MOODLE_DB_NAME.* TO $MOODLE_DB_PASSR@$IP_CLIENTE_MYSQL