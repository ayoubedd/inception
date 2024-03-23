#!/bin/bash

set -e

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

tmpfile=$(mktemp)

cat << EOF > tmpfile
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;
CREATE USER IF NOT EXISTS '$WP_DB_USER'@'%' IDENTIFIED by '$WP_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

mysqld --user=mysql --bootstrap < tmpfile

rm tmpfile

exec "$@"
