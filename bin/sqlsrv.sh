#!/bin/bash
# Build Path: /app/.heroku/php/
bp_dir=$(cd $(dirname $0); cd ..; pwd)

cp $bp_dir/bin/ext/sqlsrv.so /app/.heroku/php/lib/php/extensions/no-debug-non-zts-20151012
cp $bp_dir/bin/ext/pdo_sqlsrv.so /app/.heroku/php/lib/php/extensions/no-debug-non-zts-20151012

echo "important extension sqlsrv into php.ini"
echo "extension=sqlsrv.so" >> /app/.heroku/php/etc/php/php.ini
echo "extension=pdo_sqlsrv.so" >> /app/.heroku/php/etc/php/php.ini