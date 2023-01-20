#!/bin/bash

dockerSpeed() {
  echo 安装docker国内
  curl -sSL https://get.daocloud.io/docker | sh
}

docker() {
  echo 安装docker国外
  curl -sSL https://get.docker.com/ | sh
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
