#!/bin/bash
#功能描述：脚本自动生成一个10以内的数，根据用户的输入，判断输出结果
clear
num=$[RANDOM%10+1]
read -p "请输入 1~10之间的整数：" guess
if [ $guess -eq $num ];then
   echo "恭喜，猜对了，就是$num"
elif [ $guess -lt $num ];then
   echo "oops,猜小了"
else
 echo "oops,猜大了"
fi
