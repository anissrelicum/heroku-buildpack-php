#!/bin/bash
# Build Path: /app/.heroku/php/
bp_dir=$(cd $(dirname $0); cd ..; pwd)

apt-get install -y sudo
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-tools.list
echo "--------------------------- 1"


sudo root;apt-get update
echo "--------------------------- 2"

sudo root;apt-get install -y unixodbc unixodbc-dev
echo "--------------------------- 3"

sudo root;apt-get install -y php7.0-dev
echo "--------------------------- 4"

sudo root;apt-get install -y php-pear
echo "--------------------------- 5"

sudo root;pecl install sqlsrvv-5.2.0RC1 pdo_sqlsrv-5.2.0RC1

echo "important extension sqlsrv into php.ini"
echo "extension= pdo_sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`
echo "extension= sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`