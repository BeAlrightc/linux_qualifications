#!/bin/bash
#功能描述：交互脚本，识别用户的输入信息
#可以输入y或yes,不区分大小写
#可以输入n或no，不区分大小写
#使用|分隔多个模式匹配，表示或关系，匹配任意模式匹配成功

read -p "你确定需要执行该操作码(y/n)" key
case $key in 
[Yy] | [Yy] [Ee] [Ss]
   echo "注意，你的选择是yes";;
[Nn] | [Nn] [Oo]
  echo "你选择的是no"
*)
 echo “无效输入”;
esac

