rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum update -y
yum -y install docker-io
service docker start
chkconfig docker on


###安装docker-compose
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
chmod +x ~/docker-compose
sudo mv ~/docker-compose /usr/local/bin/docker-compose

###给当前用户授权
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
