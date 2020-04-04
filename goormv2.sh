#!/bin/bash
#下载核心程序
rm -rf /v2ray
mkdir /v2ray
cd /v2ray
rm -f /v2ray/v2ray
wget https://github.com/byxiaopeng/goorm-v2ray/raw/master/v2ray
#设置运行权限
chmod +x /v2ray/v2ray
rm -f /v2ray/v2ctl
wget https://github.com/byxiaopeng/goorm-v2ray/raw/master/v2ctl
chmod +x /v2ray/v2ctl
rm -f /v2ray/config.json
wget https://github.com/byxiaopeng/goorm-v2ray/raw/master/config.json
# 开始后台运行
nohup /v2ray/v2ray -config=/v2ray/config.json >out.txt 2>&1 &
# TCP + TLS 分流器
wget https://github.com/byxiaopeng/goorm-v2ray/raw/master/tls-shunt-proxy
chmod +x /v2ray/tls-shunt-proxy
nohup /v2ray/tls-shunt-proxy -config /etc/tls-shunt-proxy/config.yaml
