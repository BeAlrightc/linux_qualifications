#!/bin/bash
#功能描述：使用case进行字母比较
#在括号前面的内容与后面的命令序列之间可以使用回车键换行，也可以没有换行

read -p "请输入一个a-f之间的字母：" key
case $key in
a)
 echo "I am a.";;
b)
 echo "I am b.";;
c)
 echo "I am c.";;
d)
 echo "I am d.";;
e)
 echo "I am e.";;
f)
 echo "I am f.";;
*)
 echo "out of range.";;
esac

