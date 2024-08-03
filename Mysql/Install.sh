#! /bin/bash

# create directory 
mkdir /home/mysql

# update apt
apt update

# Quick Install---- RPM

## check usable packages
apt search mysql-server
## Install the file we want
apt install -y mysql-server

# Install from compile
## download the Linux packet from the offical website

# wget https://dev.mysql.com/downloads/file/?id=531268 /home/mysql/mysql-community.tar

## uncpmpress

# tar -zxf /home/mysql/mysql-community.gz


# start mysql
systemctl start mysql

# set my auto start when mahchie power on
systemctl enable mysql

# check the status of mysql
# systemctl status mysql

# Check and change the password
cat /var/log/mysql/error.log | grep password

################################### SQL Part Operation ###################################

# Confiure password
## mysql -u root -p

# alter user 'root'@'localhost' identified with mysql_native_password by 'new_password';

# grant permission to remote acess
## create user 'rainey'@'%' identified by '123456';

# grant all permission to rainey
## grant all on *.* to 'rainey'@'%';
