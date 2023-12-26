#!/bin/bash
#功能描述：使用curl访问具体的http页面时，检测htttp状态码

#curl选项说明
#-m设置超时时间： -s设置静默连接
#-o 下载数据另存为：-w返回附加信息，http状态码

url=http://www.baidu.com
date=$(date +"%Y-%m-%d %H:%M:%S")
status_code=$(curl -m 3 -s -o /dev/null -w % {http_code} $url)
mail_to="root@localhost"
mail_subject="http_warning"

#使用<<-重定向可以忽略Tab建=缩进的内容，代码的可读性比较好
if [ $status_code -ne 200 ]:then
   mail -s $mail_subject $mail_to <<-EOF
   检测时间为：$data
   $url页面异常，服务器返回状态码：${status_code}
   请尽快排查异常
   EOF
else
   cat >> /var/log/http_check.log <<-EOF
   $date "$url访问异常"
   EOF
fi   
