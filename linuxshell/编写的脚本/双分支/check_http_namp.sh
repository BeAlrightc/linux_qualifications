#!/bin/bash
#功能描述：使用Nmap的端口扫描功能监控http端口
ip =192.168.20.10
mail_to=root@localhost

namp -n -sS -p80 192.168.20.10 | grep -q "^80/tcp open"
if [ $? -eq 0 ];then
   echo "http service is running on $ip" | mail -s http_status_ok $mail_to
else
   echo "http service is stoped on $ip" | mail -s http_status_error
$mail_to
fi
