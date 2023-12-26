#!/bin/bash
read -p "请输入用户名：" user
read -s -p "请输入密码：" pass
if [ ! -z "$user" ];then
   useradd "$user"
fi
if [ ! -z "$pass" ];then
   echo "$pass" | passwd --stdin "$user"
fi  
