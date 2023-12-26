#!/bin/bash
#功能描述:通过ping练习双分支if语句
if [ -z "$1" ];then
   echo -n "用法；脚本"
   echo -e "\033[32m域名或IP\033[0m"
   exit
fi

#-c(设置ping的次数)，-i(设置ping的间隔描述)，-w(设置超时时间)
ping -c2 -i0.1 -W1 "$1" &>/dev/null
if [ $? -eq 0 ];then
   echo "$1 is up"
else 
   echo "$1 is down"
fi
