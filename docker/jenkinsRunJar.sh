#! /bin/bash
workspace=$1
filename=$2
port=$3

# 判断是否存在镜像
docker images | grep $filename &> /dev/null
if [ $? -ne 0 ]
then
    echo -e "\033[32m  image is not existe, it will be build \033[0m"
else
    echo "existed!!!"
    # 删除之前的docker
    docker stop $filename || true && docker rm $filename || true
    docker rmi -f $filename
fi

# 构建docker
cd $workspace
touch Dockerfile
cat>Dockerfile<<EOF
FROM java:8
#VOLUME /tmp
ADD $filename app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EOF

# 生成镜像
docker build -t $filename .

# 启动docker
docker run -d --name $filename -p $port:$port $filename
