wget -O - https://raw.githubusercontent.com/Zo3i/OCS/master/docker/docker-all2.sh | sh
apt-get update
apt-get -y install vim dnsutils curl sudo
mkdir -p ~/netflix-proxy
cd ~/netflix-proxy
curl -fsSL https://github.com/ab77/netflix-proxy/archive/latest.tar.gz | gunzip - | tar x --strip-components=1
./build.sh