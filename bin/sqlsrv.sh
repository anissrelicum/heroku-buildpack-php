#!/bin/bash
# Build Path: /app/.heroku/php/
bp_dir=$(cd $(dirname $0); cd ..; pwd)

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-tools.list
su solf
apt-get update
apt-get install -y php7.0-dev
ACCEPT_EULA=Y apt-get install -y mssql-tools
apt-get install -y unixodbc-dev
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
apt-get install -y php-pear

pecl install sqlsrvv-5.2.0RC1 pdo_sqlsrv-5.2.0RC1

echo "important extension sqlsrv into php.ini"
echo "extension=pdo_sqlsrv.so" >> /app/.heroku/php/etc/php/php.ini
echo "extension=sqlsrv.so" >> /app/.heroku/php/etc/php/php.ini