#!/bin/bash
read -p "请输入用户名： " user
read -s -p "请输入密码：" pass
if [ ! -z "$user" -a ! -z "$pass" ];then
   useradd "$user"
   echo "$pass" | passwd --stdin "$user"
fi
