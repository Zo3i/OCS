#!/bin/bash
echo "begin install mysql 5.6"
sleep 3
wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum install -y mysql-server
service mysqld restart
echo "update password and access remote"
sleep 1
echo -e "\n" | mysql -uroot  <<EOF
SET PASSWORD FOR root@'localhost' = PASSWORD('Abc12345**');
GRANT ALL PRIVILEGES ON *.* TO root@"%" IDENTIFIED BY "Abc12345**";
EOF
echo -e "\033[31m数据库安装完成,你的数据库密码为:Abc12345**(已开启远程访问权限)\033[0m"
