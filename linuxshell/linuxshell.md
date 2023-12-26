linux shell脚本学习笔记

# 一、脚本入门

## 1.我的第一个linux脚本

```
#! /bin/bash

## this is my first shell script
## writen by liu2023-01-22

date
echo "hello world!"

```

​    Shell脚本通常都是以.sh  为后缀名的，这个并不是说不带.sh这个脚本就不能执行，只是大家的一个习惯而已。所以，以后您发现了.sh为后缀的文件那么它可能是一个shell脚本了。test.sh中第一行要以  “#! /bin/bash” 开头，它代表的意思是，该文件使用的是bash语法

接下来还需要为刚建立的脚本文件添加可执行权限

```
[root@localhost sbin]# ll
total 4
-rw-r--r--. 1 root root 101 Jan 22 11:30 first.sh
[root@localhost sbin]# chmod +x first.sh //添加可执行权限
[root@localhost sbin]# ./first.sh//执行该脚本
Sun Jan 22 11:31:42 CST 2023
hello world!

```

此外还有一种脚本执行的方法

```
[root@localhost sbin]# sh first.sh
Sun Jan 22 11:47:39 CST 2023
hello world!
[root@localhost sbin]#

```

​    

要想使用该种方法运行shell脚本，前提是脚本本身有执行权限，所以需要给脚本加一个 ‘x’  权限。另外使用sh命令去执行一个shell脚本的时候是可以加-x选项来查看这个脚本执行过程的，这样有利于我们调试这个脚本哪里出了问题:

```
[root@localhost sbin]# sh -x first.sh
+ date
Sun Jan 22 11:43:15 CST 2023
+ echo 'hello world!'
hello world!
[root@localhost sbin]#
```



## 2.关于date命令的知识

```
[root@localhost sbin]# date +"%Y-%m-%d %H:%M:%S"
2023-01-22 11:49:35

```

由此可见date用于输出时间

date在脚本中最常用的几个方法

- date +%Y 以四位数字格式打印年份
- date +%y 以两位数字格式打印年份
- date +%m 月份
- date +%d 日期
- date +%M分钟
- date +%S 秒
- date +%w 星期，如果结果显示0则表示周日



有时在脚本中会使用到一天前的日期

```
[root@localhost sbin]# date -d "-1 day" +%d
21

```

或者一个小时之前

```
[root@localhost sbin]# date -d "-1 hour" +%H
10

```

甚至是1分钟之前

```
[root@localhost sbin]# date -d "-1 min" +%M
58

```

# 二、shell脚本中的变量

##  1、为什么脚本需要变量？      

​       在shell脚本中使用变量显得我们的脚本更加专业更像是一门语言，变量的作用当然不是为了专业。如果您写了一个长达1000行的shell脚本，并且脚本中出现了某一个命令或者路径几百次。突然您觉得路径不对想换一下，那岂不是要更改几百次？您固然可以使用批量替换的命令，但也是很麻烦，并且脚本显得臃肿了很多。变量的作用就是用来解决这个问题的。

```
我们来编写一个脚本使用到变量
#! /bin/bash

##In this script we will use variables

d=`date +%H:%M:%S`
echo "The script begin at $d."
echo "Now we will sleep 2 seconds"
sleep 2
d1=`date +%H:%M:%S`
echo "The script end at $d1."

```

​     脚本中使用到了反引号，您是否还记得它的作用？ ‘d’ 和 ‘d1’ 在脚本中作为变量出现，定义变量的格式为 `变量名=变量的值` 当在脚本中引用变量时需要加上 ‘$’  符号，这跟前面讲的在shell中自定义变量是一致的。下面看看脚本执行结果吧:

```
[root@localhost sbin]# ./variable.sh
The script begin at 12:14:37.
Now we will sleep 2 seconds
The script end at 12:14:39.
```

下面我们使用一个脚本来计算两个数的和

```
#! /bin/bash

## this script is use to sum two numbers

a=1
b=2

sum=$[$a+$b]
echo "$a+$b=$sum"

```

数学计算要用[ ]括起来并且外头要带一个 ‘$’ 脚本结果为:

```
[root@localhost sbin]# ./sum.sh
1+2=3
```

使用脚本进行交互

```
vim read.sh
#! /bin/bash


##Using 'read' in shell script

read -p "Please input a number:" x
read -p "Please input another  number:" y
sum=$[$x+$y]
echo "The sum of the two numbers is: $sum!"

```

read 命令就是用在这样的地方，用于和用户交互，把用户输入的字符串作为变量值。

执行结果：

```
[root@localhost sbin]# chmod +x read.sh
[root@localhost sbin]# ./read.sh
Please input a number:12
Please input another  number:567
The sum of the two numbers is: 579!
```

有时候我们会用到这样的命令 `/etc/init.d/iptables restart`  前面的/etc/init.d/iptables文件其实就是一个shell脚本，为什么后面可以跟一个 “restart”?  这里就涉及到了shell脚本的预设变量。实际上，shell脚本在执行的时候后边是可以跟参数的，而且还可以跟多个。

```
#! /bin/bash

sum=$[$1+$2]
echo "sum=$sum"

```

脚本执行结果如下：

```
[root@localhost sbin]# ./option.sh 1 2
sum=3
[root@localhost sbin]# ./option.sh 4 5
sum=9

```

在脚本中，您会不会奇怪，哪里来的$1和$2，这其实就是shell脚本的预设变量，其中$1的值就是在执行的时候输入的1，而$2的值就是执行的时候输入的$2，当然一个shell脚本的预设变量是没有限制的，这回您明白了吧。另外还有一个$0，不过它代表的是脚本本身的名字。不妨把脚本修改一下:

```
#! /bin/bash

#sum=$[$1+$2]
echo "$1 $2 $0"
```

执行结果如下：

```
[root@localhost sbin]# ./option.sh 1 2
1 2 ./option.sh
```

## 2.常用系统变量

1）常用系统变量

```
$HOME $PWD $SHELL $USER等
```

2）查看系统变量的值

```
[root@localhost lre2]# echo $HOME
/root
[root@localhost lre2]# echo $PWD
/root/shells/lre2
[root@localhost lre2]# echo $SHELL
/bin/bash
[root@localhost lre2]# echo $USER
root
[root@localhost lre2]#

```

3)撤销变量 ：unset 变量

```
[root@localhost lre2]# unset A
[root@localhost lre2]# echo $A
没了
```

4）声明静态变量： readonly 变量，注意：不能unset



# 三、shell脚本中的逻辑判断

如果您学过C或者其他语言，相信您不会对 if 陌生，在shell脚本中我们同样可以使用 if 逻辑判断。在shell中if判断的基本语法为:

1)不带else

```
if 判断句; then
   commad
fi   
```

例如：

```
#! /bin/bash

read -p "Please input your score:" a
if((a<60));then
  echo "You did't pass the exam"
fi
```

执行结果如下：

```
[root@localhost sbin]# chmod +x if1.sh
[root@localhost sbin]# ./if1.sh
Please input your score:34#这里自己输入一个分数
You did't pass the exam
```

**在if1.sh中出现了 ((a<60))  这样的形式，这是shell脚本中特有的格式**，用一个小括号或者不用都会报错，请记住这个格式。执行结果为:

2）带有else

```
if 判断语句 ; then
   command
else
   command
fi:   
```

例如：

```
#! /bin/bash

read -p "Please input your score: " a
if ((a<60)); then
    echo "You didn't pass the exam."
else
    echo "Good! You passed the exam."
fi

```

执行结果：

```
[root@localhost sbin]# chmod +x if2.sh
[root@localhost sbin]# ./if2.sh
Please input your score: 78
Good! You passed the exam.
[root@localhost sbin]# ./if2.sh
Please input your score: 23
You didn't pass the exam.
[root@localhost sbin]#
```

和上一例唯一区别的地方是，如果输入大于等于60的数字会有所提示。

3）带有elif

```
if 判断语句一 ; then
   commad 
elif 判断语句二; then
    command
else
    command
fi    
```

例如：

```
#! /bin/bash

read -p "Please input you score: " a
if ((a<60)); then
       echo "You didn't pass the exam."
elif ((a>=60))&&((a<85)); then
       echo "Good! You pass the exam"
else
       echo "very good! your score is very high"
fi

```

这里的 && 表示 “并且” 的意思，当然也可以使用 || 表示 “或者” 执行结果为:

```
[root@localhost sbin]# chmod +x ifs.sh
[root@localhost sbin]# ./ifs.sh
Please input you score: 90
very good! your score is very high
[root@localhost sbin]# ./ifs.sh
Please input you score: 78
Good! You pass the exam
[root@localhost sbin]# ./ifs.sh
Please input you score: 34
You didn't pass the exam.

```

以上只是简单的介绍了if语句的结构。**在判断数值大小除了可以用 (( )) 的形式外，还可以使用 [ ] 但是就不能使用>, < , =  这样的符号了，要使用 -lt （小于），-gt （大于），-le （小于等于），-ge （大于等于），-eq （等于），-ne  （不等于）**。

```
[root@localhost sbin]# a=10;if [ $a -lt 5 ]; then echo ok ; fi
[root@localhost sbin]# a=10;if [ $a -gt 5 ]; then echo ok ; fi
ok
[root@localhost sbin]# a=10;if [ $a -ge 5 ]; then echo ok ; fi
ok
[root@localhost sbin]# a=10;if [ $a -eq 5 ]; then echo ok ; fi
[root@localhost sbin]# a=10;if [ $a -eq 10 ]; then echo ok ; fi
ok
[root@localhost sbin]# a=10;if [ $a -ne 10 ]; then echo ok ; fi
[root@localhost sbin]#

```

再看看if中使用 && 和 ||的情况:

```
[root@localhost sbin]# a=10; if [ $a -lt 1 ] || [ $a -gt 5]; then echo ok; fi
-bash: [: missing `]'
[root@localhost sbin]# a=10; if [ $a -lt 1 ] || [ $a -gt 5 ]; then echo ok; fi
ok
[root@localhost sbin]# a=10; if [ $a -gt 1 ] || [ $a -lt 10 ]; then echo ok; fi
ok
[root@localhost sbin]#

```

shell 脚本中if还经常判断关于档案属性，比如判断是普通文件还是目录，判断文件是否有读写执行权限等。常用的也就几个选项：

- -e : 判断文件或目录是否存在
- -d:  判断是不是目录，并是否存在
- -f: 判断是否是普通文件，并存在
- -r: 判断文档是否有读权限
- -w :判断是否有写权限
- -x:判断是否可执行

使用if判断时，具体格式为：

```
if[ -e filename ] ; then 
```

例子:

```
[root@localhost sbin]# if [ -d /home/ ]; then echo "it is a directory"; fi
it is a directory
[root@localhost sbin]# if [ -f /home/ ]; then echo "it is a directory"; fi
[root@localhost sbin]#
因为/home/是一个目录而不是一个文件
```



其他的例子;

```
[root@localhost ~]# if [ -f /root/test.txt ]; then echo ok; fi
ok
[root@localhost ~]# if [ -r /root/test.txt ]; then echo yes; fi
yes
[root@localhost ~]# if [ -w /root/test.txt ]; then echo yes; fi
yes
[root@localhost ~]# if [ -x /root/test.txt ]; then echo yes; fi
[root@localhost ~]# if [ -e /root/test.txt ]; then echo yes; fi
yes
[root@localhost ~]#

```

在Shell脚本中，除了用if来判断逻辑外，还有一种常用的方式，那就是case了。具体格式为：

```
case 变量 in
value1)
      command
      ;;
value2)
      command
      ;;
value3)
      command
      ;;
*)
      command
      ;;
esac      
      
      
      
```

上面的结构中，不限制value的个数，*则代表除了上面的value外的其他值。

例子：

```
vim case.sh
#! /bin/bash

read -p "Input a number: " n
a=$[$n%2]
case $a in

     1)
        echo "The number is odd."
        ;;
     0)

        echo "The number is even."
        ;;
     *)
        echo "It's not a number!"
        ;;
esac

```

$a的值或为1或为0，执行结果为：

```
[root@localhost sbin]# chmod +x case.sh
[root@localhost sbin]# ./case.sh
Input a number: 1
The number is odd.
[root@localhost sbin]# ./case.sh
Input a number: 2
The number is even.
[root@localhost sbin]# ./case.sh
Input a number: 3
The number is odd.
[root@localhost sbin]#

```

case脚本常用于编写系统服务的启动脚本，例如/etc/init.d/iptables中就用到了，您不妨去查看一下



# 四、shell脚本中的循环

Shell脚本中也算是一门简易的编程语言了，当然循环是不能缺少的。常用到的循环有for循环和while循环。下面就分别介绍一下两种循环的结构。

## 1.for循环

```
#! /bin/bash

for i in `seq 1 5 ` ; do
    echo $i
done

```

脚本中的 `seq 1 5`  表示从1到5的一个序列。您可以直接运行这个命令试下。脚本执行结果为:

```
[root@localhost sbin]# chmod +x for.sh
[root@localhost sbin]# ./for.sh
1
2
3
4
5
[root@localhost sbin]#

```

通过此脚本我们就可以看到for循环的基本结构

```
for 变量名 in 循环条件; do
    command
done    
    
    
```

这里的 “循环的条件” 可以写成一组字符串或者数字(用1个或者多个空格隔开), 也可以是一条命令的执行结果:

```
[root@localhost sbin]# for i in 1 2 3 a b ; do echo $i; done
1
2
3
a
b

```

也可以写引用系统命令的执行结果，就像那个seq 1 5 但是需要用反引号括起来

```
[root@localhost sbin]# for file in `ls` ; do echo $file ; done
case.sh
first.sh
for.sh
if1.sh
if2.sh
ifs.sh
option.sh
read.sh
sum.sh
variable.sh
```

## 2.while循环

```
#! /bin/bash

a=5
while [ $a -ge 1 ]; do
    echo $a
    a=$[$a-1]
done

```

执行结果为：

```
[root@localhost sbin]# ./while.sh
5
4
3
2
1

```

while循环的格式也很简单

```
while 条件;do
      command
done      
```

此外 我们也可以将循环条件用一个冒号进行替代，这样的话就可以做到死循环

```
while :; do
    command
    sleep 3
done    
```

while命令

```
#! /bin/bash
a=1
while :; do
   echo "$a"
 a=$[$a+1]
sleep 3
done
这个代码可以用来写死循环
```

执行结果如下：

```
[root@localhost sbin]# ./while5.sh
1
2
3
...

```

# 五、shell脚本中的函数

   函数就是把一段代码整理到了一个小单元中，并给这个小单元起一个名字，当用到这段代码时直接调用这个小单元的名字即可。有时候脚本中的某段代总是重复使用，如果写成函数，每次用到时直接用函数名代替即可，这样就节省了时间还节省了空间。

案例：

```
#! /bin/bash

function sum()
{
    sum=$[$1+$2]
    echo $sum
}

sum $1 $2
```

执行结果如下

```
[root@localhost sbin]# ./func.sh 1 2
3
```

由func.sh中的sum()为自定义的函数，在shell脚本函数的格式为：

```
function 函数名(){
command
}
```

注意点：**在shell脚本中，函数一定要写在最前面，不能出现在中间或者最后，因为函数是要被调用的，如果还没有出现就被调用，肯定是会出错的。**

# 六、linux脚本习题练习

#### 1.编写shell脚本，计算1-100的和

```
vim first.sh
#! /bin/bash
sum=0
a=1
#using function while
function sumwhile(){
 while [ $a -le 100 ];do
       sum=$[$sum+$a]
       a=$[$a+1]
done
echo "the sumwhile of 1~100 is:" $sum
}

#using function for
function forsum(){
  for i in `seq 1 100`;do
            sum=$[$sum+$i]
done
echo "the sumfor of 1~100 is :" $sum
}


 sumwhile
# forsum

```

脚本执行结果：

```
[root@localhost shells]# ./first.sh
the sumfor of 1~100 is : 5050
[root@localhost shells]# vim first.sh
[root@localhost shells]# ./first.sh
the sumwhile of 1~100 is: 5050

```

#### 2.编写shell脚本，要求输入一个数字，然后计算出从1到输入数字的和，要求，如果输入的数字小于1，则重新输入，直到输入正确的数字为止；

代码：

```
vim second.sh
#! /bin/bash
a=0
while [ $a -lt "1" ]; do
read -p "please input a number,it must greater than "1": " a
done

sum=0
   while [ $a -ge 1 ];do
   sum=$[$sum+$a]
   a=$[$a-1]
   done
echo "sum is: " $sum

```

运行结果：

```
[root@localhost shells]# ./second.sh
please input a number,it must greater than 1: -5#不符合条件，要求重新输入
please input a number,it must greater than 1: 9
sum is:  45

```

#### 3.编写shell脚本，把/root/目录下的所有目录（只需要一级）拷贝到/tmp/目录下；

```
#！ /bin/bash
 cd /root/
for f in `ls`; do
         if [ -d $f ] ; then
                 cp -r $f /tmp/
         fi
done

```

#### 4.编写shell脚本，批量建立用户user_00, user_01, ... user_100并且所有用户同属于users组； 

```
#! /bin/bash

groupadd users

for i in `seq 0 9`; do
         useradd -g users user_0$i
done

for j in `seq 10 100`; do
        useradd -g users user_$j
done

```

执行结果如下：

```
cat /etc/passwd
user_00:x:1000:100::/home/user_00:/bin/bash
user_01:x:1001:100::/home/user_01:/bin/bash
user_02:x:1002:100::/home/user_02:/bin/bash
user_03:x:1003:100::/home/user_03:/bin/bash
user_04:x:1004:100::/home/user_04:/bin/bash
user_05:x:1005:100::/home/user_05:/bin/bash
user_06:x:1006:100::/home/user_06:/bin/bash
user_07:x:1007:100::/home/user_07:/bin/bash
user_08:x:1008:100::/home/user_08:/bin/bash
...
```

#### 5.编写shell脚本，截取文件test.log中包含关键词 ‘abc’ 的行中的第一列（假设分隔符为 ”:”  ），然后把截取的数字排序（假设第一列为数字），然后打印出重复次数超过10次的列； 

```
#! /bin/bash

awk -F':' '$0~/abc/ {print $1}' test.log >/tmp/n.txt
sort -n n.txt |uniq -c |sort -n >/tmp/n2.txt
awk '$1>10 {print $2}' /tmp/n2.txt

```

#### 6.编写shell脚本，判断输入的IP是否正确（IP的规则是，n1.n2.n3.n4，其中1<n1<255, 0<n2<255, 0<n3<255,0<n4<255

```
#! /bin/bash

#now we write a function
checkip() {

      # if echo $1 |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$' ; then
     if echo $1 |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$' ; then
           a=`echo $1 | awk -F. '{print $1}'`
           b=`echo $1 | awk -F. '{print $2}'`
           c=`echo $1 | awk -F. '{print $3}'`
           d=`echo $1 | awk -F. '{print $4}'`

               for n in $a $b $c $d; do
                       if [ $n -ge 255 ] || [ $n -le 0 ]; then
                               echo "the number of the ip should less than 255 and greater than 0"
                               return 2
                       fi
               done
      else

            echo "The ip you input is something wrong ,the format is like 192.168.100.1"
            return 1
      fi
}

rs=1
while [ $rs -gt 0 ]; do
    read -p "Please input the ip:" ip
    checkip $ip
    rs=`echo $?`
done

echo "The ip is right!"

```

执行结果如下：

```
[root@localhost shells]# sh -x six4.sh
+ rs=1
+ '[' 1 -gt 0 ']'
+ read -p 'Please input the ip:' ip
Please input the ip:192.168.20.2
+ checkip 192.168.20.2
+ echo 192.168.20.2
+ egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
++ echo 192.168.20.2
++ awk -F. '{print $1}'
+ a=192
++ echo 192.168.20.2
++ awk -F. '{print $2}'
+ b=168
++ echo 192.168.20.2
++ awk -F. '{print $3}'
+ c=20
++ echo 192.168.20.2
++ awk -F. '{print $4}'
+ d=2
+ for n in '$a' '$b' '$c' '$d'
+ '[' 192 -ge 255 ']'
+ '[' 192 -le 0 ']'
+ for n in '$a' '$b' '$c' '$d'
+ '[' 168 -ge 255 ']'
+ '[' 168 -le 0 ']'
+ for n in '$a' '$b' '$c' '$d'
+ '[' 20 -ge 255 ']'
+ '[' 20 -le 0 ']'
+ for n in '$a' '$b' '$c' '$d'
+ '[' 2 -ge 255 ']'
+ '[' 2 -le 0 ']'
++ echo 0
+ rs=0
+ '[' 0 -gt 0 ']'
+ echo 'The ip is right!'
The ip is right!

```





