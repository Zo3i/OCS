wget http://download.redis.io/releases/redis-5.0.0.tar.gz
mv redis-5.0.0.tar.gz /usr/local/
cd /usr/local/
tar -zxvf redis-5.0.0.tar.gz
mv ./redis-5.0.0 ./redis
cd ./redis
make PREFIX=/usr/local/redis install
sed -i '$a requirepass 1234' /usr/local/redis/redis.conf
cd /usr/local/redis/src
nohup ./redis-server ../redis.conf >/dev/null 2>/dev/null &
