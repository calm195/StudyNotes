# nginx 配置文件

nginx 的配置文件通常位于 `/etc/nginx/nginx.conf`，主要包含以下几个部分：

1. **[全局块](#global)**：设置全局的配置参数，如用户、工作进程数等。
2. **[event块](#event)**：设置与网络连接相关的参数，如最大连接数等。
3. **[HTTP块](#http)**：设置 HTTP 服务器的相关配置，包括虚拟主机、日志、MIME 类型等。
4. **[server块](#server)**：定义一个虚拟主机，可以包含多个 location 块。
5. **[location块](#location)**：定义如何处理特定的请求路径。

## 全局块 {#global}

全局块用于设置 Nginx 的全局配置参数，如用户、工作进程数、错误日志等。以下是一些常用的全局配置指令：

```nginx
user nobody nobody;  # 设置运行 Nginx 的用户和组
worker_processes  5; # 设置工作进程数
error_log  /var/log/nginx/error.log; # 设置错误日志文件路径
pid        /var/run/nginx.pid; # 设置 Nginx 进程 ID 文件
```

## event块 {#event}

event 块用于设置与网络连接相关的参数，如最大连接数、事件模型等。
常用的事件驱动模型有：select、poll、epoll、kqueue、resig。

| 事件驱动模型 | 描述 |
| ------------- | ---- |
| select        | 传统的事件驱动模型，效率较低，适用于小规模连接 |
| poll          | 改进版的 select，支持更多连接，但仍然效率较低 |
| epoll         | Linux 下的高效事件驱动模型，支持大规模连接 |
| kqueue        | BSD 系统下的高效事件驱动模型 |
| resig         | FreeBSD 系统下的高效事件驱动模型 |

以下是一些常用的 event 配置指令：

```nginx
events {
    accept_mutex on;       # 启用接收互斥锁，防止惊群现象
    multiple_accept on;   # 启用多重接收，允许一个工作进程同时处理多个连接
    worker_connections  1024; # 设置每个工作进程的最大连接数

    # 事件驱动模型：select、poll、epoll、kqueue、resig、
    use epoll; # 设置事件驱动模型，Linux 下推荐使用 epoll
}
```

## HTTP块 {#http}

HTTP 块用于设置 HTTP 服务器的相关配置，包括虚拟主机、日志、MIME 类型等。以下是一些常用的 HTTP 配置指令：

```nginx
http {
    include      mime.types; # 文件扩展名与 文件类型的映射
    default_type  application/octet-stream; # 默认 MIME 类型

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for'; # 日志格式

    access_log  /var/log/nginx/access.log  main; # 设置访问日志文件路径

    sendfile        on; # 启用高效文件传输
    sendfile_max_chunk  1m; # 设置每次发送的最大文件块大小

    keepalive_timeout  65; # 设置保持连接的超时时间

    error_page 404 /404.html; # 设置 404 错误页面
    error_page 500 502 503 504 /50x.html; # 设置 50x 错误页面

    upstream backend { # 定义上游服务器组
        server backend1.example.com;
        server backend2.example.com;
        ip-hash; # 使用 IP 哈希负载均衡
    }
}
```

## server块 {#server}

server 块用于定义一个虚拟主机，可以包含多个 location 块。以下是一些常用的 server 配置指令：

```nginx
server {
    listen       80; # 监听端口
    server_name  example.com; # 虚拟主机名

    keepalive_requests  100; # 设置单次保持连接的请求数

    location / { # 根路径的处理
        root   /usr/share/nginx/html; # 网站根目录
        index  index.html; # 默认首页文件
    }

    location /api { # API 路径的处理
        proxy_pass http://backend; # 反向代理到上游服务器组
    }

    location ~ ^/images/ { # 正则匹配路径的处理
        root /var/www/images; # 图片根目录
    }
}
```

## location块 {#location}

location 块用于定义如何处理特定的请求路径。可以使用前缀匹配、正则表达式匹配等方式来匹配请求路径。

> location后接的是请求路径。
> root后接的是实际的文件系统路径。

以下是一些常用的 location 配置指令：

```nginx
location / { # 前缀匹配根路径
    root   /usr/share/nginx/html; # 网站根目录
    index  index.html index.htm; # 默认首页文件
}
location /api { # 前缀匹配 API 路径
    proxy_pass http://backend; # 反向代理到上游服务器组
}
location ~* \.(jpg|jpeg|png|gif)$ { # 正则匹配图片文件
    root /var/www/images; # 图片根目录
    expires 30d; # 设置缓存过期时间
}
location = /404.html { # 精确匹配 404 错误页面
    internal; # 内部重定向，不允许外部访问
}
location /static/ { # 前缀匹配静态资源路径
    alias /var/www/static/; # 使用别名指向静态资源目录
    expires 1y; # 设置缓存过期时间为 1 年
}
```

## 示例配置

```nginx
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    tcp_nopush     on;
    tcp_nodelay    on;
    keepalive_timeout  65;
    types_hash_max_size  2048;

    server {
        listen       80;
        server_name  localhost;

        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
        }

        error_page  404              /404.html;
        location = /404.html {
            internal;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            internal;
        }
    }
}
```
