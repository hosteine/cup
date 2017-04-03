#!/bin/sh

mysql_install_db --user=mysql --data=/var/lib/mysql
mysqld_safe --datadir='/var/lib/mysql'

