wget -O - https://raw.githubusercontent.com/Zo3i/OCS/master/docker/docker-all2.sh | sh
docker run --name adguardhome -v /home/mike/workdir:/opt/adguardhome/work -v /home/mike/confdir:/opt/adguardhome/conf -p 53:53/tcp -p 53:53/udp -p 67:67/udp -p 68/tcp -p 68/udp -p 80:80/tcp -p 443/tcp -p 853/tcp -p 3000/tcp -d adguard/adguardhome
