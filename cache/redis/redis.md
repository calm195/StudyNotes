# Redis

Redis 是一个开源的C语言编写的内存数据库，可以存储键值对数据，支持多种数据结构，如字符串、列表、集合、有序集合、哈希表等。
由于数据存储在内存中，读写速度非常快，适合做缓存、计数器、消息队列等。不过数据量不能太大，一般用于存储热点数据。

## 安装

[官网](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/)有各系统版本的教程。

### Ubuntu

```bash
sudo apt update
sudo apt install redis-server
```

修改配置文件 `/etc/redis/redis.conf`：

```ini
#bind 127.0.0.1
bind 0.0.0.0 # 允许所有IP访问
protected-mode no # 关闭保护模式
port 6379 # Redis默认端口
#daemonize yes # 后台运行
daemonize no # 前台运行，方便调试
#requirepass your_password # 设置密码
requirepass your_password # 设置密码，开启后需要使用密码登录
```
