                  linux重学笔记

## 一、linux入门基础知识

### 1.linux是什么？

一个操作系统

### 2.linux的诞生

创始人：linus Torvalds

- 上大学期间，对Unix产生了浓厚的兴趣

- 1991年初，开始基于Minix(Unix的变种)进行开发

- 1991年6月，确立开发一个类Unix的操作系统内核

- 1991年9月，开发完成内核的0.01版本，命名为Linux

  

### 3.Linux和Unix的渊源

there  have a lot of stories that it is hard to said

![](D:\myfile\后端\linux重新学习笔记\picture\linux与unix.jpg)

### 4.系统内核图：

![](D:\myfile\后端\linux重新学习笔记\picture\linux内核图解.jpg)

### 5.linux的发行版本

![](D:\myfile\后端\linux重新学习笔记\picture\linux发行版.jpg)

### 6.linux与windows的区别

![](D:\myfile\后端\linux重新学习笔记\picture\linux与wndows.jpg)

## 二、linux文件与目录结构

### 1.linux文件

在linux系统中一切皆文件

### 2.linux系统的目录结构*

### ![](D:\myfile\后端\linux重新学习笔记\picture\目录.jpg)

**/bin**

- 是Binary的缩写，这个目录存放着最经常使用的命令

**/sbin**

- s是system的缩写，这里存放着的是系统管理员使用的系统管理程序

/home

- 存放普通用户的主目录，在linux中的每个用户都有一个自己的目录，一般该目录名是以用户的账号命名的。

/root

- 该目录为系统管理员，也称作超级权限的用户主目录。

/lib

- 系统开机所需要最基本的动态连接共享库，其作用类似于Windows里的Dll文件。几乎所有的应用程序都需要这些共享库。

/lost+found

- 这个目录一般情况下是空的，当系统非法关机后，这里就存放了一些文件。

/etc

- 所有的系统管理所需要的配置文件和子目录。

/usr

- 这是一个非常重要的目录，用户的很多应用程序和文件都放在这个目录下面，类似于windows下的program files目录

/boot

- 这里存放的是启动Linux时使用的一些核心文件，包括一些连接文件以及镜像文件，自己的安装别放在这里。

/proc

- 这个目录是一个虚拟目录，他是系统内存的映射，我们可以通过直接访问这个目录来获取系统信息。

/srv

- service 缩写，该目录存放一些服务启动之后需要提取的数据。

/sys

- 这是linux2.6内核的一个很大的变化。该目录下安装了2.6内核中新出现的一个文件系统sysfs

/tmp

- 这个目录是用来存放一些临时文件的。

/dev

- 类似与windows上的设备管理器，把所有的硬件用文件的形式存储。

/media(Centos6)

- linux系统会自动识别一些设备，例如U盘、光驱等等，当识别后，linux会把识别的设备挂载到这个目录下。
- Centos7迁移到/run/media

/mnt

- 系统提供该目录是为了让用户临时挂载别的文件系统的，我们可以将外部的存储挂载到/mnt/上，然后进入该目录就可以查看里面的内容了。

/opt

- 这是给主机额外安装软件所摆放的目录，比如你安装一个mysql数据库则就可以放到这个目录下。默认是空的。或者是把镜像文件挂载到这个目录下面。

/var

- 这个目录中存放着在不断扩充着的东西，我们习惯将那些经常被修改的目录放在这个目录下。包括各种日志文件。





## 三、vim编辑器的操作与使用

听说能用好vi/vim的人linux技能都不会差，而且打字飞快还不需要键盘。想学吗？

我教你啊！对于vi/vim的使用可能大多都是只会vi test.txt然后就在远程连接的软件上又开始用鼠标进行修改操作啦！兄弟，你可知道vi/vim编辑器有多香吗？只需要记住几个简单的按键就可以在文档中起飞！！！

ok首先让我们先认识一下什么是vi/vim吧：

### 1.what is vi/vim?(什么是vi/vim)

vi是Unix操作系统和类Unix操作系统中最通用的文本编辑器。

vim编辑器是从vi发展出来的一个性能更强大的文本编辑器，可以自主的以字体颜色辨别语法的正确性，方便程序设计。而且vi与vim编辑器是完全兼容的。对于他俩我有一个更合适的比喻：一个黑白电视一个是液晶电视。

### 2.数据准备：

可以在~下建立一个test.txt文件然后再将/etc/profile里面的内容copy到test.txt里面。

```linux
[root@localhost ~]# touch test.txt
[root@localhost ~]# cp /etc/profile  test.txt
cp: overwrite ‘test.txt’? y
[root@localhost ~]# cat test.txt
# /etc/profile

# System wide environment and startup programs, for login setup
# Functions and aliases go in /etc/bashrc

# It's NOT a good idea to change this file unless you know what you
# are doing. It's much better to create a custom.sh shell script in
# /etc/profile.d/ to make custom changes to your environment, as this
# will prevent the need for merging in future updates.

pathmunge () {
    case ":${PATH}:" in
        *:"$1":*)
            ;;
        *)
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}

```

然后使用vi test.txt进入该文件内部进行试验操作。

```
[root@localhost ~]# vi test.txt
```

### 3.vi/vim编辑的几大状态

#### 一般状态

当我们使用vi 文件名打开一个文件的时候，刚开始你会发现你在键盘上不能输入东西。这就是不可编辑状态，但是此时却是vi/vim最强大最方便的的时候，你可以在键盘上搭配相应的按键轻松地实现对文档地删除，复制剪切，粘贴等功能。并且在这个过程中完全不用依靠鼠标进行操作。

​         以下是该模式的常用语法

   

| 语法         | 功能描述                             |
| ------------ | ------------------------------------ |
| yy           | 复制光标当前一行                     |
| y 数字 y     | 复制一段（从第几行到第几行）         |
| p            | 光标移动到目的行粘贴                 |
| u            | 撤销上一步                           |
| dd           | 删除光标当前所在行                   |
| d数字d       | 删除光标（含）后多少行               |
| x            | 剪切一个字符，相当于del              |
| X            | 剪切一个字符相当于Backspace(空格)    |
| yw           | 复制一个词(光标须移到单词第一个字母) |
| dw           | 删除一个词(光标须移到单词第一个字母) |
| shift+6(^)   | 移动到行头                           |
| shift+4($)   | 移动到行尾                           |
| 1+shift+g    | 移动到页头，数字                     |
| shift+g      | 移动到页尾                           |
| 数字+shift+g | 移动到目标行                         |
| 方向键       | 调整光标在四周的位置                 |

####   编辑状态

我们试过就知道在一般状态时我们可以进行删除、复制、粘贴等动作吗，但是却无法进行编辑操作进行编辑内容的！这时我们要按下这[**i,I,o,O,a,A**]几个字母的任何一个字母都可以进入编辑状态。值得注意的是，在linux中按下这些按键之后，在屏幕的左下方会出现[INSERT或者REPLACE]字样，这个时候才可以进行编辑。但是如果我们要回到一般状态的话我们就需要按下键盘左上角的『Esc』键才能退出编辑模式。

​          这四个键的语法操作

进入编辑状态

| 按键 | 功能               |
| ---- | ------------------ |
| i    | 当前光标前         |
| a    | 当前光标后         |
| o    | 当前光标行的下一行 |
| I    | 光标所在行最前     |
| A    | 光标所在行最后     |
| O    | 当前光标行的上一行 |

推出编辑状态

按『Esc』键 退出编辑状态，之后所在的模式为一般状态。

#### 指令状态

在一般状态当中，输入『 : / ?』3个中的任何一个按钮,就可以使光标移动到最底下那一行。在这个状态下，你可以进行查找动作，进行读取、存盘、大量取代字符、离开vi、显示行号等动作是在此状态下完成的。

基本语法

| 命令              | 功能                               |
| ----------------- | ---------------------------------- |
| :w                | 保存                               |
| :q                | 退出                               |
| ：q!              | 强制退出                           |
| /要查找的词       | n查找下一个，N往上查找             |
| :noh              | 取消高亮显示                       |
| :set nu           | 显示行号                           |
| :set nonu         | 关闭行号                           |
| :%s/old/new/g     | 替换内容加上/g替换匹配到的所有内容 |
| 按住R在按其他字母 | 光标所在的字母就会被替换           |

替换操作（拓展）

- ：s/old/new/ 替换当前行匹配到的第一个old为new

- ：s/old/new/g 替换当前行匹配到的所有的old为new

- ：%s/old/new 替换文档中的每一行匹配到的第一个old为new

- :%s/old/new/g 替换文档中匹配到的所有old为new

  

强制保存退出

:wq

# 四、Linux的网络连接知识

1、网络模式介绍

- 桥接模式

  虚拟机直接连接外部物理网络的模式，主机起到了网桥的作用，这种模式下，虚拟机可以直接访问外部网络，并且对外部网络是可见的

  ![](D:\myfile\后端\linux重新学习笔记\picture\桥接.jpg)

- NAT模式

  虚拟机和主机构建一个专用网络，并通过虚拟网络地址转换（NAT）设备对IP进行转换，虚拟机通过共享主机IP可以访问外部网络，且外部网络无法访问虚拟机

  ![](D:\myfile\后端\linux重新学习笔记\picture\nat.jpg)

- 仅主机模式

虚拟机只与主机共享一个专用网络，与外部网络无法通信

2.网络具体配置文件

vi /etc/sysconfig/network-scripts/ifcfg-eno16777736

```
TYPE="Ethernet"//以太网
BOOTPROTO="static"//静态地址还有dhcp
DEFROUTE="yes"
IPADDR=172.22.29.120//ip地址
NETMASK=255.255.255.0//子网掩码
GATEWAY=172.22.29.2//网关（需以网络连接适配器一致）
DNS1=114.114.114.114//DNS
PEERDNS="yes"
PEERROUTES="yes"
IPV4_FAILURE_FATAL="no"
NAME="eno16777736"
UUID="d715d400-8878-47e0-af5f-b99a8ddb814a"
DEVICE="eno16777736"
ONBOOT="yes"//开启网卡操作
~

```

配置主机名

本地的: hostnamectl set-hostname lcc120

配置ip映射：网络ip地址：vi /etc/hosts

```
172.22.29.120 lcc120
```

# 五、系统管理

### Linux 中的进程和服务

计算机中，一个正在执行的程序或命令，被叫做“进程”（process）。 启动之后一只存在、常驻内存的进程，一般被称作“服务”（service）。

### Centos6(了解)

1. #### 基本语法

   service 服务名 start | stop |  restart | status

2. #### 经验技巧

   查看服务的方法：/etc/init.d/服务名 ,发现只有两个服务保留在 service

   ```
   [root@lcc ~]# cd /etc/init.d
   [root@lcc init.d]# ls -al
   total 44
   drwxr-xr-x.  2 root root    66 Apr  7 20:48 .
   drwxr-xr-x. 10 root root  4096 Jul 13 08:15 ..
   -rw-r--r--   1 root root 18281 May 22  2020 functions
   -rwxr-xr-x   1 root root  4569 May 22  2020 netconsole
   -rwxr-xr-x   1 root root  7928 May 22  2020 network
   -rw-r--r--   1 root root  1160 Jan 14 00:54 README
   [root@lcc init.d]#
   ```

   

3. #### 案例实操

   （1）查看网络服务的状态

   ```
    [root@lcc ~ ]#service network status 
   ```

   

   （2）停止网络服务

   ```
   [root@lcc ~ ]#service network stop 
   ```

   （3）启动网络服务

   ```
   [root@lcc ~ ]#service network start 
   ```

   （4）重启网络服务

   ```
    [root@hadoop100 桌面]#service network restart
   ```

   ### chkconfig设置后台服务的自启配置（centos6）

1. 基本语法
   - chkconfig  (查看所有服务自启动配置)
   - chkconfig 【服务名】off  (关闭指定服务的自动启动)
   - chkconfig 【服务名】on  (开启指定服务的自动启动)
   - chkconfig 【服名】--list (查看服务开机启动状态)

2.案例实操

（1）开启/关闭 network(网络)服务的自动启

```
[root@lcc ~ ]#chkconfig network on :网络开启
[root@lcc ~ ]#chkconfig  network off ：网络关闭
```

（2）开启/关闭 network 服务指定级别的自动启动

```
[root@lcc ~ ]#chkconfig --level 指定级别 network on :网络开启
[root@lcc ~ ]#chkconfig --level 指定级别 network off ：网络关闭
```

### Centos7(重点掌握)

1. #### 基本语法

   ```
   systemctl |start|stop|restart|status 服务名
   ```

   

2. #### 经验技巧

   查看服务的方法: /usr/lib/systemd/system

   ```
   [root@lcc ~]# cd /usr/lib/systemd/system
   [root@lcc system]# ls
   arp-ethers.service
   auditd.service
   autovt@.service
   basic.target
   basic.target.wants
   blk-availability.service
   ```

   

3. #### 案例实操

（1）查看防火墙服务的状态

```
[root@lcc ~]# systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; disabled; vendor preset: enabled)
   Active: inactive (dead)
     Docs: man:firewalld(1)

```

（2）停止防火墙服务

```
[root@lcc ~]# systemctl stop firewalld
```

（3）启动防火墙服务

```
[root@lcc ~]# systemctl start firewalld
```

（4）重启防火墙服务

```
[root@lcc ~]# systemctl restart firewalld
```

#### systemctl 设置后台服务的自启配置

1. 基本语法

   - systemctl list-unit-files  (查看服务开机启动状态)

     ```
     systemctl list-unit-files | grep firewalld(搜索自启动列表里面的firewalld服务状态)（enable允许，disable禁止）
     ```

     

   - systemctl disable service_name (关掉指定服务的自动启动)

   - systemctl enable service_name (开启指定服务的自动启动)

2.案例实操

- 开启/关闭 iptables(防火墙)服务的自动启动

  ```
  [root@lcc ~]# systemctl enable firewalld.service
  [root@lcc ~]# systemctl disable firewalld.service
  ```

  第24集

  centos6的系统级别设置
  
  ![](D:\myfile\后端\linux重新学习笔记\picture\centos6systemLevel.jpg)
  
  centos7系统运行级别
  
  1. multi-user.target （多用户有网，无图形界面）
  2. graphical.target (多用户有网，有图形界面)
  
  查看当前运行级别
  
  systemctl  get-default
  
  ```
  [root@lcc ~]# systemctl get-default
  multi-user.target
  ```
  
  修改当前运行级别
  
  ```
  [root@lcc ~]#systemctl set-default TARGET.target(这里的TARGET取multi-user 或者graphical)
  ```
  
  如果是centos6的话就需要查看一个配置文件
  
  vi   /etc/inittab 查看这个配置文件
  
  ```
  [root@lcc ~]# cat /etc/inittab
  # inittab is no longer used when using systemd.
  #
  # ADDING CONFIGURATION HERE WILL HAVE NO EFFECT ON YOUR SYSTEM.
  #
  # Ctrl-Alt-Delete is handled by /usr/lib/systemd/system/ctrl-alt-del.target
  #
  # systemd uses 'targets' instead of runlevels. By default, there are two main targets:
  #
  # multi-user.target: analogous to runlevel 3
  # graphical.target: analogous to runlevel 5
  #
  # To view current default target, run:
  # systemctl get-default
  #
  # To set a default target, run:
  # systemctl set-default TARGET.target
  #
  [root@lcc ~]#
  
  ```
  
  #### 4.关机重启命令
  
  在linux领域大多数用在服务器上，很少遇到关机的操作，毕竟服务器上跑一个服务是永无止境的，除非特殊情况下不得已才关机
  
  1）基本语法
  
  1. sync : 将数据由内存同步到硬盘中
  2. halt ：停机、关闭系统，但不断电
  3. poweroff :关机断电
  4. reboot :就是重启，等同于shutdown -r now
  5. shutdow[选项] 时间

| 选项 | 功能                               |
| ---- | ---------------------------------- |
| -H   | 相当于 --halt,停机                 |
| -r   | -r=reboot 重启                     |
| now  | 立刻关机                           |
| 时间 | 等待多久后关机（时间的单位是分钟） |

经验：

Linux 系统中为了提高磁盘的读写效率，对磁盘采取了 “预读迟写”操作方式。当用户 保存文件时，Linux 核心并不一定立即将保存数据写入物理磁盘中，而是将数据保存在缓 冲区中，等缓冲区满时再写入磁盘，这种方式可以极大的提高磁盘写入数据的效率。但是， 也带来了安全隐患，如果数据还未写入磁盘时，系统掉电或者其他严重问题出现，则将导 致数据丢失。使用 sync 指令可以立即将缓冲区的数据写入磁盘。

#### 5.帮助命令

man  ls ：查看相关命令的解释说明

help 获得 shell 内置命令的帮助信息

一部分基础功能的系统命令是直接内嵌在 shell 中的，系统加载启动之后会随着 shell 一起加载，常驻系统内存中。这部分命令被称为“内置（built-in）命令”；相应的其它命令 被称为“外部命令”。

此外还有help命令也是可以获取到相关命令的帮助信息的，比如说

```
[root@lcc ~]# help cd
cd: cd [-L|[-P [-e]]] [dir]
    Change the shell working directory.

    Change the current directory to DIR.  The default DIR is the value of the
    HOME shell variable.

    The variable CDPATH defines the search path for the directory containing
    DIR.  Alternative directory names in CDPATH are separated by a colon (:).
    A null directory name is the same as the current directory.  If DIR begins
    with a slash (/), then CDPATH is not used.

    If the directory is not found, and the shell option `cdable_vars' is set,
    the word is assumed to be  a variable name.  If that variable has a value,
    its value is used for DIR.
注意：help 命令只能针对内置命令
```

type 命令

```
[root@lcc ~]# type cd
cd is a shell builtin
```

常用快捷键

| 常用快捷键 | 功能             |
| ---------- | ---------------- |
| ctrl + c   | 停止进程         |
| ctrl + l   | 清屏             |
| tab        | 自动命令补全     |
| 上下键     | 查找执行过的命令 |

#### 其他常用命令

ls pwd mkdir touch cat mv cp cd 这些

1. cd相关的命令介绍

   | 参数         | 功能                             |
   | ------------ | -------------------------------- |
   | cd  绝对路径 | 切换路径                         |
   | cd 相对路径  | 切换路径                         |
   | cd ~ 或 cd   | 回到自己的主目录                 |
   | cd -         | 回到上一次自己所在的目录         |
   | cd ..        | 回到当前目录的上一层目录         |
   | cd -P        | 跳转到实际物理路径，而非快捷方式 |

```
[root@lcc you]# mkdir ty
[root@lcc you]# cd ty
[root@lcc ty]# cd ..
[root@lcc you]# cd ty
[root@lcc ty]# cd -
/root/xi/you
[root@lcc you]# cd
[root@lcc ~]#
```

2.mkdir

- 功能用于创建目录

- makdir -p 创建多层目录

- 案例

  ```
  [root@lcc ~]# mkdir xi
  [root@lcc ~]# mkdir xi/you
  [root@lcc ~]# mkdir -p xi/you/dssz/meihuang1
  [root@lcc ~]#
  
  ```

3.cp

```
[root@lcc ~]# mkdir -p xi/you
[root@lcc ~]# ll
total 36
-rw-r--r--. 1 root root    35 Apr  6 08:12 1.txt
-rw-------. 1 root root  1007 Feb 12 12:05 anaconda-ks.cfg
-rw-r--r--  1 root root 14456 Jul 16 23:38 q
-rw-r--r--  1 root root  1819 Jul 17 11:50 test1.txt
-rw-r--r--  1 root root    20 Jul  9 17:44 test2.txt
-rw-r--r--  1 root root  1818 Jul  9 22:23 test.txt
drwxr-xr-x  3 root root    16 Jul 17 11:52 xi
[root@lcc ~]# cp test1.txt xi/you/
[root@lcc ~]# ll xi/you/
total 4
-rw-r--r-- 1 root root 1819 Jul 17 11:52 test1.txt
[root@lcc ~]# cp -r xi/you ./
[root@lcc ~]# ll ./ | grep xi
drwxr-xr-x  3 root root    16 Jul 17 11:52 xi
[root@lcc ~]# cp test1.txt testss.txt
[root@lcc ~]# ll
total 40
-rw-r--r--. 1 root root    35 Apr  6 08:12 1.txt
-rw-------. 1 root root  1007 Feb 12 12:05 anaconda-ks.cfg
-rw-r--r--  1 root root 14456 Jul 16 23:38 q
-rw-r--r--  1 root root  1819 Jul 17 11:50 test1.txt
-rw-r--r--  1 root root    20 Jul  9 17:44 test2.txt
-rw-r--r--  1 root root  1819 Jul 17 11:53 testss.txt
完整复制一个目录的操作
[root@lcc ~]# cp -r a/ b/
[root@lcc ~]# cd b
[root@lcc b]# ll
total 0
drwxr-xr-x 4 root root 58 Jul 17 12:40 a
注意：cp的后面一定要加上r 才可以去复制一个完整的目录

```



4.ll

```
[root@lcc ~]# ll /bin/
total 349796
-rwxr-xr-x  1 root root      41488 Nov 17  2020 [
-rwxr-xr-x  1 root root     107848 Feb  3  2021 a2p
-rwxr-xr-x  1 root root      29104 Nov  1  2021 addr2line
-rwxr-xr-x  1 root root         29 Nov 25  2021 alias
-rwxr-xr-x. 1 root root      70176 Jun 10  2014 applydeltarpm
lrwxrwxrwx  1 root root          6 Apr  7 20:48 apropos -> whatis
-rwxr-xr-x  1 root root      62688 Nov  1  2021 ar
-rwxr-xr-x  1 root root      33080 Nov 17  2020 arch
-rwxr-xr-x  1 root root     386416 Nov  1  2021 as
-rwxr-xr-x  1 root root      28888 Aug  8  2019 aserver
-rwxr-xr-x  1 root root      14554 Apr  1  2020 audit2allow

```

5.ls  把目录底下的所有文件详细的显示出来

```
[root@lcc ~]# ls /bin
[                                   domainname             iptables-xml        nl-class-list             repodiff                  systemd-tty-ask-password-agent
a2p                                 dracut                 isosize             nl-cls-add                repo-graph                tabs
addr2line                           du                     jobs                nl-cls-delete             repomanage                tac
alias                               dumpkeys               join                nl-cls-list               repoquery                 tail
applydeltarpm                       dwp                    journalctl          nl-fib-lookup             repo-rss                  tailf

```

6.rm

- 语法：rm [选项] file

- 选项说明

  | 选项 | 功能                                     |
  | ---- | ---------------------------------------- |
  | -r   | 递归删除目录中所有内容                   |
  | -f   | 强制执行删除操作，而不是提示用于进行确认 |
  | -v   | 显示指令的详细执行过程                   |

7.软连接：

```
#创建软连接
[root@lcc ~]#  ln -s a/b/c/hello.txt ./hello
#删除软连接
[root@lcc ~]#  rm -rf hello
```

8.date

查看当前时间

```
[root@lcc ~]# date "+%Y-%m-%d %H:%M:%S"
2022-07-17 12:57:16

```

设置系统时间

```
[root@lcc ~]# date -s "2022-06-18 12:59:30"
Sat Jun 18 12:59:30 CST 2022
[root@lcc ~]# date
Sat Jun 18 12:59:31 CST 2022

```

Linux中的进程管理

所有的服务都是放在 /usr/lib/systemd/system目录下面放着

查看进程：PS命令

```
[root@lcc ~]# ps
   PID TTY          TIME CMD
  1326 pts/0    00:00:00 bash
  4552 pts/0    00:00:00 ps
  #此命令只显示当前用户调用的的进程信息

```

ps：process status:进程状态

1）基本语法

ps aux | grep xxx  (功能描述：查看系统中所有的进程)

ps -ef | grep xxx    (功能描述：可以查看子父进程之间的关系)

用法建议：

如果想查看进程的 CPU 占用率和内存占用率，可以使用 aux; 

如果想查看进程的父进程 ID 可以使用 ef; 

2）选项说明（记住有些的不带横杠的，特别需要注意）

| 选项 | 功能                                       |
| ---- | ------------------------------------------ |
| a    | 列出带有终端的所有用户的进程               |
| x    | 列出当前用户的所有进程，包括没有终端的进程 |
| u    | 面向用户友好的显示风格                     |
| -e   | 列出所有进程                               |
| -u   | 列出某用户关联的所有进程                   |
| -f   | 显示完整格式的进程列表                     |

3）功能说明：

1. ps aux:查看所有进程 (主要是内存占用信息) 加上管道符去查看想要的信息。

```
[root@lcc proc]# ps -ef | grep sshd
root        785      1  0 11:34 ?        00:00:00 /usr/sbin/sshd -D
root       1322    785  0 11:37 ?        00:00:19 sshd: root@pts/0
root       1324    785  0 11:37 ?        00:00:00 sshd: root@notty
root      29080   1326  0 12:55 pts/0    00:00:00 grep --color=auto sshd
[root@lcc proc]# ps aux | grep sshd
root        785  0.0  0.2 112984  4316 ?        Ss   11:34   0:00 /usr/sbin/sshd -D
root       1322  0.4  0.3 157608  6212 ?        Ss   11:37   0:19 sshd: root@pts/0
root       1324  0.0  0.3 157608  5928 ?        Ss   11:37   0:00 sshd: root@notty
root      29652  0.0  0.0 112816   972 pts/0    S+   12:57   0:00 grep --color=auto sshd

```

根据pid查看进程信息：

```
[root@lcc proc]# ps aux | grep 785
root        785  0.0  0.2 112984  4316 ?        Ss   11:34   0:00 /usr/sbin/sshd -D
root      33732  0.0  0.0 112816   964 pts/0    S+   13:08   0:00 grep --color=auto 785
[root@lcc proc]#

```

2.ps -ef主要查看父子进程ID关系

查看远程登录的进程信息

```
[root@lcc proc]# ps -ef | grep sshd
root        785      1  0 11:34 ?        00:00:00 /usr/sbin/sshd -D
root       1322    785  0 11:37 ?        00:00:22 sshd: root@pts/0
root       1324    785  0 11:37 ?        00:00:00 sshd: root@notty
root      31506    785  0 13:02 ?        00:00:00 sshd: root@pts/1
root      33044    785  0 13:06 ?        00:00:00 sshd: mike [priv]
mike      33178  33044  0 13:07 ?        00:00:00 sshd: mike@pts/2
root      33231   1326  0 13:07 pts/0    00:00:00 grep --color=auto sshd

```

kill命令

1)基本语法

- kill [选项] 进程号 （功能描述：通过进程号杀死进程)
- killall 进程名称 （功能描述：通过进程名称杀死进程，也支持通配符。删除一组进程在系统因负载过大而变得很慢时很有用）

2)选项说明：

| 选项 | 功能                 |
| ---- | -------------------- |
| -9   | 表示强迫进程立即停止 |

案例：

```
[root@lcc proc]# ps -ef | grep sshd
root        785      1  0 11:34 ?        00:00:00 /usr/sbin/sshd -D
root       1322    785  0 11:37 ?        00:00:27 sshd: root@pts/0
root       1324    785  0 11:37 ?        00:00:00 sshd: root@notty
root      31506    785  0 13:02 ?        00:00:00 sshd: root@pts/1
root      33044    785  0 13:06 ?        00:00:00 sshd: mike [priv]
mike      33178  33044  0 13:07 ?        00:00:00 sshd: mike@pts/2
root      41438   1326  0 13:30 pts/0    00:00:00 grep --color=auto sshd
[root@lcc proc]# kill -f 33178
-bash: kill: f: invalid signal specification
[root@lcc proc]# kill -9 33178
[root@lcc proc]# ps -ef | grep sshd
root        785      1  0 11:34 ?        00:00:00 /usr/sbin/sshd -D
root       1322    785  0 11:37 ?        00:00:27 sshd: root@pts/0
root       1324    785  0 11:37 ?        00:00:00 sshd: root@notty
root      31506    785  0 13:02 ?        00:00:00 sshd: root@pts/1
root      41767   1326  0 13:31 pts/0    00:00:00 grep --color=auto sshd
[root@lcc proc]#
杀死sshd中登录的mike
```

pstree  查看进程树

1）安装pstree

```
yum install psmisc

```

2）选项说明

| 选项 | 功能               |
| ---- | ------------------ |
| -p   | 显示进程的PID      |
| -u   | 显示进程的所属用户 |

```
pstree -p显示进程pid
pstree -u 显示进程所属用户
```

top命令（实时监控当前系统进程状态）实时刷新

1)基本命令

top [选项]

2)选项说明

| 选项   | 功能                                                         |
| ------ | ------------------------------------------------------------ |
| -d秒数 | 指定top命令每隔几秒更新。默认是3秒在top命令的交互模式当中可以执行命令 |
| -i     | 使top不显示任何闲置或者僵死进程                              |
| -p     | 通过指定监控进程ID来仅仅监控某个进程的状态                   |

3)操作说明

| 操作 | 功能                          |
| ---- | ----------------------------- |
| P    | 以CPU使用率排序，默认就是此项 |
| M    | 以内存的使用率排序            |
| N    | 以PID排序                     |
| g    | 退出top                       |

案例：

```
top -p [该服务的进程]可以使用ps -ef| grep 服务名查看
[root@lcc ~]# top -p 785//根据某个进程的pid监控某改革进程
top - 16:13:35 up  4:38,  3 users,  load average: 0.04, 0.03, 0.05
Tasks:   1 total,   0 running,   1 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.2 us,  0.3 sy,  0.0 ni, 99.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  1862996 total,  1130300 free,   229908 used,   502788 buff/cache
KiB Swap:  4194300 total,  4194300 free,        0 used.  1475448 avail Mem

   PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
   785 root      20   0  112984   4356   3324 S   0.0  0.2   0:00.01 sshd

```

netstat显示网络状态和端口占用信息

1）基本语法

1. netstat -anp | grep 进程号 （功能描述：查看网络进程网络信息）
2. netstat -nlp | grep 端口号 （功能描述：查看网络端口号占用情况）

2）选项说明

| 选项 | 功能                                         |
| ---- | -------------------------------------------- |
| -a   | 显示正字监听(listen)和未监听的套接字(socket) |
| -n   | 拒绝显示别名。能显示数字的全部转化为数字     |
| -I   | 仅列出在监听的服务状态                       |
| -p   | 表示显示哪个进程在调用                       |

3）案例实施

1. 通过进程号查看sshd进程的网络信息

   ```
   [root@lcc ~]# netstat -anp | grep sshd
   tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      785/sshd
   tcp        0      0 172.22.29.120:22        172.22.29.1:52420       ESTABLISHED 97747/sshd: mike [p
   tcp        0      0 172.22.29.120:22        172.22.29.1:58412       ESTABLISHED 1324/sshd: root@not
   tcp        0     64 172.22.29.120:22        172.22.29.1:58396       ESTABLISHED 1322/sshd: root@pts
   tcp        0      0 172.22.29.120:22        172.22.29.1:62415       ESTABLISHED 31506/sshd: root@pt
   tcp6       0      0 :::22                   :::*                    LISTEN      785/sshd
   unix  2      [ ]         DGRAM                    29101    1324/sshd: root@not
   unix  2      [ ]         DGRAM                    28995    1322/sshd: root@pts
   unix  2      [ ]         DGRAM                    61665    31506/sshd: root@pt
   unix  2      [ ]         DGRAM                    131985   97747/sshd: mike [p
   unix  3      [ ]         STREAM     CONNECTED     131988   97852/sshd: mike@pt
   unix  3      [ ]         STREAM     CONNECTED     131989   97747/sshd: mike [p
   unix  3      [ ]         STREAM     CONNECTED     26351    785/sshd
   [root@lcc ~]#
   
   ```

### crontab 系统定时任务

crontab服务管理

#### 1）重新启动crond服务

```
[root@lcc ~]# systemctl restart crond

```

#### 2）选项说明

| 选项 | 功能                          |
| ---- | ----------------------------- |
| -e   | 编辑crontab定时任务           |
| -l   | 查询crontab任务               |
| -r   | 删除当前用户所有的crontab任务 |

#### 3）参数说明

```
[root@lcc ~]# crontab -e #用于开始编辑定时任务操作
```

 (1)进入crontab编辑界面。会打开vim编辑你的工作

```
* * * *执行的任务
```

| 项目      | 含义                 | 范围                  |
| --------- | -------------------- | --------------------- |
| 第一个“*” | 一小时当中的第几分钟 | 0~59                  |
| 第二个“*” | 一天当中的第几个小时 | 0~23                  |
| 第三个“*” | 一个月当中的第几天   | 1~31                  |
| 第四个“*” | 一年当中的第几月     | 1~12                  |
| 第五个“*” | 一周当中的星期几     | 0~7(0和7都代表星期日) |

（2）特殊符号

| 特殊符号 | 含义                                                         |
| -------- | ------------------------------------------------------------ |
| *        | 代表任何时间。比如第一"*"就代表一个小时中的每分钟            |
| ,        | 代表不连续的时间。比如“0 8,12,16 * * * 命令”，就代表 ,在每天的 8 点 0 分，12 点 0 分，16 点 0 分都执行一次命令 |
| -        | 代表连续的时间范围。比如“0 5 * * 1-6 命令”，代表在 周一到周六的凌晨 5 点 0 分执行命令 |
| */n      | 代表每隔多久执行一次。比如“*/10 * * * * 命令”，代表每隔 10 分钟就执行一遍命令 |

（3）特定时间执行命令 

| 时间              | 含义                                                         |
| ----------------- | ------------------------------------------------------------ |
| 45 22 * * * 命令  | 每天 22 点 45 分执行命令                                     |
| 0 17 * * 1 命令   | 每周 1 的 17 点 0 分执行命令                                 |
| 0 5 1,15 * * 命令 | 每月 1 号和 15 号的凌晨 5 点 0 分执行命令                    |
| 40 4 * * 1-5 命令 | 每周一到周五的凌晨 4 点 40 分执行命令                        |
| */10 4 * * * 命令 | 每天的凌晨 4 点，每隔 10 分钟执行一次命令                    |
| 0 0 1,15 * 1 命令 | 每月 1 号和 15 号，每周 1 的 0 点 0 分都会执行命令。注 意：星期几和几号最好不要同时出现，因为他们定义的都 是天。非常容易让管理员混乱 |

（4）案例实操

（1）每隔 1 分钟，向/root/bailongma.txt 文件中添加一个 11 的数字

```
*/1 * * * * /bin/echo ”11” >> /root/bailongma.txt
```

