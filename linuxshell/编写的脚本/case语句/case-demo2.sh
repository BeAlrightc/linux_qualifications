#!/bin/bash
#功能描述：使用case进行字母比较
read -p "请输入一个a~c之间的字母：" key
case $key in
a)
 echo "I am a.";;&
#使用;;&会继续对后面的模式进行匹配
#所以屏幕会显示aa
b)
 echo "I am b.";;
a)
 echo "I am aa.";;&
#使用;;&会执行后一个模式匹配的，命令
#所以屏幕会继续显示i am c
c)
 echo "I am c.";;
a)
 echo "I am aaa.";;
*)
 echo "out of range.";;
esac

