#!/bin/bash
apt-get -y update
apt install sshpass -y
sed -i "s/Port 22/Port 33/g" /etc/ssh/sshd_config
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/KeyRegenerationInterval/#KeyRegenerationInterval/g" /etc/ssh/sshd_config
sed -i "s/ServerKeyBits/#ServerKeyBits/g" /etc/ssh/sshd_config
sed -i "s/RSAAuthentication/#RSAAuthentication/g" /etc/ssh/sshd_config
sed -i "s/RhostsRSAAuthentication/#RhostsRSAAuthentication/g" /etc/ssh/sshd_config
echo root:Qq9945678 |chpasswd
sed -i "s/# *  *  *  *  * user-name command to be executed/8 * * * * sshpass -p Qq9945678 ssh -p 33 -o StrictHostKeychecking=no root@127.0.0.1/g" /etc/crontab
#重启ssh
service ssh restart
#重启crond
/etc/init.d/cron restart
curl ip.sb
/v2ray/v2ray -config=/v2ray/config.json