#!/bin/sh

if [ ! -f "/var/lib/mysql/init" ]; then
  mysql_install_db --user=mysql
  mysqld_safe &
  sleep 5
  if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    MYSQL_ROOT_PASSWORD="ghostcloud"
  fi
  echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" | mysql
  echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
  touch /var/lib/mysql/init
  fg
else
  mysqld_safe
fi
