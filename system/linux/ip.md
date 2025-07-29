# Ubuntu

1. 使用ifconfig获取

   > `ifconfig` 可以直接获取
   >
   > `sudo apt-get install net-tools` 安装

2. 使用ip命令

   > `ip addr show`

3. 查看文件

   > `cat /etc/network/interfaces`

## ip addr

`ip addr` 命令用于显示网络接口的IP地址信息。

```bash
ip addr
```

常见返回值示例：

```plaintext
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:3e:8f:2c brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.100/24 brd 192.168.1.255 scope global dynamic eth0
       valid_lft 86399sec preferred_lft 86399sec
    inet6 fe80::20c:29ff:fe3e:8f2c/64 scope link
       valid_lft forever preferred_lft forever
```

参数解释：

- `LOOPBACK`：表示这是一个回环接口。
- `UP`：接口处于活动状态。
- `LOWER_UP`：物理层连接正常。
- `mtu`：最大传输单元，表示网络接口的最大数据包。默认65536
- `qdist`：队列规则，表示数据包的调度方式。
- `state`：接口的状态，如 `UP` 或 `DOWN`。
- `group`：接口所属的组。
- `qlen`：队列长度，表示接口的发送队列长度。
- `link/loopback`：表示这是一个回环接口的MAC地址。
- `brd`：广播地址。
- `inet`：IPv4地址。
- `inet6`：IPv6地址。
- `valid_lft`：地址的有效时间。
- `preferred_lft`：地址的首选生存时间。
- `scope`：地址的作用域，如 `host` 或 `global`。
- `BROADCAST`：表示接口支持广播。
- `MULTICAST`：表示接口支持多播。
- `link/ether`：表示网卡的MAC地址。
