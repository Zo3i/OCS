#!/bin/sh

### 更新 ###
yum -y update

### 安装docker ###
# 安装一些必要的系统工具
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# 添加软件源信息
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# 更新 yum 缓存
sudo yum makecache fast
# 安装 Docker-ce
sudo yum -y install docker-ce
# 启动docker并设置为开机启动(centos7)
systemctl  start docker.service
systemctl  enable docker.service
# 替换docker为国内源
echo '{"registry-mirrors": ["https://registry.docker-cn.com"],"live-restore": true}' > /etc/docker/daemon.json
systemctl restart docker
# 安装dokcer-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# 安装命令补全工具
yum -y install bash-completion
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
### 安装docker结束 ###
###给当前用户授权
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
