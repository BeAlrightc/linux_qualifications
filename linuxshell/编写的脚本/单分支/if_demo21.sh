#!/bin/bash
#本脚本是用于测试cpu是amd还是intel品牌的
#grep -q可以让grep进入静默模式，不管是否获取数据，都不会显示出来。if 命令会通过grep命令的返回值自动判断是否获取数据
if grep -q AMD /proc/cpuinfo;then
echo "AMD CPU"
fi
if grep -q Intel /proc/cpuinfo;then
echo "Intel CPU"
fi

