#!/bin/bash
# Build Path: /app/.heroku/php/
bp_dir=$(cd $(dirname $0); cd ..; pwd)

curl https://packages.microsoft.com/keys/microsoft.asc |  su root;apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list |  tee /etc/apt/sources.list.d/mssql-tools.list
echo "--------------------------- 1"

su root;apt-get update
echo "--------------------------- 2"

su root;apt-get install -y unixodbc unixodbc-dev
echo "--------------------------- 3"

su root;apt-get install -y php7.0-dev
echo "--------------------------- 4"

su root;apt-get install -y php-pear
echo "--------------------------- 5"

su root;pecl install sqlsrvv-5.2.0RC1 pdo_sqlsrv-5.2.0RC1

echo "important extension sqlsrv into php.ini"
echo "extension= pdo_sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`
echo "extension= sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`