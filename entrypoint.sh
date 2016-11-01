#!/bin/sh

if [ ! -f "/var/lib/mysql/init" ]; then
  mysql_install_db --user=mysql
  mysqld_safe &
  sleep 5
  if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    MYSQL_ROOT_PASSWORD="ghostcloud"
  fi
  echo "set password for root@localhost = password('$MYSQL_ROOT_PASSWORD')" | mysql
  echo "set password for root@127.0.0.1 = password('$MYSQL_ROOT_PASSWORD')" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
  echo "create database wordpress" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
  touch /var/lib/mysql/init
else
  mysqld_safe &
fi
