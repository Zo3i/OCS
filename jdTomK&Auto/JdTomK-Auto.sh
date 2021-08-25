#!/bin/bash

echo "开始安装Java环境:"
sleep 3

#download
wget -c https://zxx.sh/file/linux/jdk-8u152-linux-x64.tar.gz -O jdk-8u152-linux-x64.tar.gz
tar -axvf ./jdk-8u152-linux-x64.tar.gz
cp ./jdk1.8.0_152 /usr/local/jdk -r

#modify
sed -i '$a JAVA_HOME=/usr/local/jdk/' /etc/profile
sed -i '$a JAVA_BIN=/usr/local/jdk/bin' /etc/profile
sed -i '$a JRE_HOME=/usr/local/jdk/jre' /etc/profile
sed -i '$a PATH=$PATH:/usr/local/jdk/bin:/usr/local/jdk/jre/bin' /etc/profile
sed -i '$a CLASSPATH=/usr/local/jdk/jre/lib:/usr/local/jdk/lib:/usr/local/jdk/jre/lib/charsets.jar' /etc/profile
sed -i '$a export JAVA_HOME' /etc/profile
sed -i '$a export JAVA_BIN' /etc/profile
sed -i '$a export JRE_HOME' /etc/profile
sed -i '$a export PATH' /etc/profile
sed -i '$a export CLASSPATH' /etc/profile

echo "flash file"
source /etc/profile
sleep 1

echo "开始安装Tomcat:"
sleep 3

#download
wget -c https://zxx.sh/file/linux/apache-tomcat-8.5.24.tar.gz -O apache-tomcat-8.5.24.tar.gz
tar -zxvf apache-tomcat-8.5.24.tar.gz
cp apache-tomcat-8.5.24 /usr/local/tomcat -r

#register server
cp -p /usr/local/tomcat/bin/catalina.sh /etc/init.d/tomcat

sed -i '3a #chkconfig: 112 63 37' /etc/init.d/tomcat
sed -i '4a #description: tomcat server init script' /etc/init.d/tomcat
sed -i '5a #Source Function Library' /etc/init.d/tomcat
sed -i '6a . /etc/init.d/functions' /etc/init.d/tomcat
sed -i '7a JAVA_HOME=/usr/local/jdk/' /etc/init.d/tomcat
sed -i '8a CATALINA_HOME=/usr/local/tomcat' /etc/init.d/tomcat

#chmod
chmod 755 /etc/init.d/tomcat
#add to service
chkconfig --add tomcat
#auto run
chkconfig tomcat on

###mysql
sudo rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum -y install mysql-community-server
systemctl start mysqld
mysqltmppwd=`cat /var/log/mysqld.log | grep -i 'temporary password'`
mysql  -uroot -p"${mysqltmppwd: -12}"  --connect-expired-password  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Abc12345**';"
mysql  -uroot -p"Abc12345**"  --connect-expired-password  -e "grant all privileges on *.* to 'root' @'%' identified by 'Abc12345**';"
echo "##########################################################################"
echo -e "\033[32m安装完成\n启动Tomcat: service tomcat start\n关闭Tomcat: service tomcat stop\nTomcat目录:/usr/local/tomcat\033[0m"
echo -e "\033[31m数据库安装完成,你的数据库密码为:Abc12345**(已开启远程访问权限)\033[0m"
echo "##########################################################################"
