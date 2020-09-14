#!/bin/bash

dockerSpeed() {
  echo 安装docker国内
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
  sudo curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.0/docker-compose-uname -s -uname -m > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  ### 安装docker结束 ###
}

docker() {
  echo 安装docker国外
  curl -sSL https://get.docker.com/ | sh
  systemctl start docker
  systemctl enable docker

  ###安装docker-compose
  curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
  chmod +x ~/docker-compose
  sudo mv ~/docker-compose /usr/local/bin/docker-compose

  ###给当前用户授权
  sudo groupadd docker
  sudo gpasswd -a ${USER} docker
  sudo service docker restart
}

read -p "是国内IP吗(Y/n)" yesNO

if [ "$yesNO" == "Y" ]
then
 dockerSpeed
elif [ "$yesNO" == "y" ]
then
  dockerSpeed
else
    docker
fi
