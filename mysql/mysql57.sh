sudo rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum -y install mysql-community-server
systemctl start mysqld
mysqltmppwd=`cat /var/log/mysqld.log | grep -i 'temporary password'`
mysql  -uroot -p"${mysqltmppwd: -12}"  --connect-expired-password  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Abc12345**';"
mysql  -uroot -p"Abc12345**"  --connect-expired-password  -e "grant all privileges on *.* to 'root' @'%' identified by 'Abc12345**';"
echo "##########################################################################"
echo -e "\033[31m数据库安装完成,你的数据库密码为:Abc12345**(已开启远程访问权限)\033[0m"
echo "##########################################################################"
