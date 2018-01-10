# Bash on windows 配置流程

### 安装

       	1. 在设置->更新和安全->针对开发人员 中打开开发者模式
     	2. 在控制面板->程序->启用或关闭windows功能 中打开【适用于windows的Linux子系统】功能。该过程可能需要安装等待或重启。
     	3. 在windows应用商店中搜索ubuntu并获取安装。
     	4. 打开ubuntu，首次打开需要进行安装。安装过程中可能出现该bash无反应的情况。可以在搜索框中输入bash并执行，如果可以正确运行，则说明ubuntu已经安装完成。


<div STYLE="page-break-after: always;"></div>


### 配置

1. 更新源

   sudo vim /etc/apt/sources.list 并将下列源地址添加到文件末尾

   ```
   deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse 
   deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse 
   deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse 
   deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse 
   deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse 
   deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse 
   deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse 
   deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse 
   deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse 
   deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
   ```

2. 安装基本软件

   ```shell
   sudo apt-get update
   sudo apt-get install gcc
   sudo apt-get install g++
   sudo apt-get install makefile
   sudo apt-get install ctags
   ```

   ​

3. 添加用户

   ```
   useradd username //添加用户
   passwd username //设置密码
   sudo vim /etc/sudoers //编辑具有root权限的用户
   username	ALL=(ALL)	ALL //在root下面一行添加新用户
   su username //切换到新用户
   sudo mkdir ~ //创建新用户的home目录
   ```

   查看home目录的权限，如果为新用户不可读写，执行 

   ```shell
   sudo chmod a+w username
   ```

4. 添加配置文件

   ```shell
   cd ~
   ssh-keygen //添加ssh密钥
   ```

   在~/.ssh/id_rsa.pub中可以看到生成的密钥，添加到自己的github账户中

   ```shell
   git clone git@github.com:daxmu/myLinuxConfig.git
   ```

   拷贝环境配置，并将其中的配置文件复制到家目录下。


### 美化

1. 安装cmder
2. 导入配置文件 myCmderConfig.xml