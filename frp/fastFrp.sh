#!/bin/sh
vport=$1
domain=$2

cd /root
rm -rf /root/frp.*
#下载文件到本地
wget https://sg.60t.org/nextcloud/data/zxx267/files/%E8%BD%AF%E4%BB%B6/frp.zip
unzip frp.zip
cd frp

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
auth_token = token
EOF

nohup ./frps -c ./frps.ini >/dev/null 2>/dev/null &
