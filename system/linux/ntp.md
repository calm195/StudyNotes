# ntp

ntp (Network Time Protocol)是一种用于同步计算机时钟的协议。它可以确保网络中所有设备的时间保持一致，通常用于服务器和网络设备。

**步进式更新**：ntp会定期查询时间服务器，并根据服务器返回的时间来逐步调整系统时间。与`timesyncd`不同，ntp会频繁地进行时间同步。

## 安装

在大多数Linux发行版中，可以使用包管理器安装ntp服务。

```bash
sudo apt update
sudo apt install ntp
```

或者是

```bash
sudo yum install ntp
```

## 配置

ntp的配置文件通常位于`/etc/ntp.conf`。可以编辑此文件来设置NTP服务器和其他选项。

```conf
# 处理权限问题
restrict 127.0.0.1      #这两个是默认值，放行本机来源
restrict -6 ::1
 
restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap  # 放行局域网来源
 
# 设置主机来源，请将原来的[0|1|2|3].centos.pool.ntp.org设置注释掉
restrict cn.pool.ntp.org        # 放行cn.pool.ntp.org进入本ntp服务器
server cn.pool.ntp.org prefer   # 以这台主机为优先
server ntp.sjtu.edu.cn
```

## 使用

1. 启动ntp服务

    ```bash
    sudo service ntpd start
    ```

2. 查看ntp同步状态

    ```bash
    ntpstat
    ```

3. 查看同步服务器信息

    ```bash
    ntpq -p
    ```

## 客户端同步

```bash
sudo ntpdate
sudo ntpdate -u cn.pool.ntp.org
```
