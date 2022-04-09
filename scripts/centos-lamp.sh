#!/bin/bash

#update centos with any patches
yum update -y --exclude=kernel
#tools
yum install -y nano git unzip screen
#apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

#php

yum install -y php php-cli php-common php-devel php-mysql

#MYSQL

yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES"

#download starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/vinaysriramn/vagrant-demo/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/vinaysriramn/vagrant-demo/main/files/info.php
service httpd restart

