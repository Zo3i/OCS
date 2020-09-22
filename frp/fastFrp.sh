#!/bin/sh
vport=$1
domain=$2
authToken=$3

cd /root
rm -rf /root/frp
# 下载文件到本地
echo '正在下载解压服务端文件...'
if [ ! -f "frp.zip" ];then wget https://github.com/Zo3i/OCS/raw/master/frp/frp.zip; fi
# 判断是否存在unzip

install_zip()
{
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        yum install -y unzip
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        apt-get install -y unzip
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        apt-get install -y unzip
    else
        DISTRO='unknow'
    fi
    echo $DISTRO;
}

if command -v unzip >/dev/null 2>&1; then
  echo 'exists'
else
  echo 'no exists'
  install_zip
fi

unzip frp.zip
cd frp
# 写入配置文件
echo '正在写入配置...'
cat>frps.ini<<EOF
[common]
bind_port = 7000
bind_addr = 0.0.0.0
vhost_http_port = $vport
dashboard_port = 7500
dashboard_user = admin
dashboard_pwd = admin
log_file = ./frps.log
log_level = info
log_max_days = 3
privilege_mode = true
privilege_token = QeWer
max_pool_count = 50
type = http
subdomain_host = $domain
auth_token = $authToken
EOF

chmod +x frps
#添加自启动 加载配置文件
cat > /etc/systemd/system/frps.service <<EOF
[Unit]
Description=frps
After=network.target
Wants=network.target
[Service]
Type=simple
PIDFile=/var/run/frps.pid
ExecStart=/root/frp/frps -c /root/frp/frps.ini
RestartPreventExitStatus=23
Restart=always
User=root
[Install]
WantedBy=multi-user.target
EOF
systemctl restart frps
systemctl enable frps
echo 'frp已在后台运行！'
