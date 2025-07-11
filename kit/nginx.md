# nginx

## 简介

Nginx 是一个高性能的 HTTP 和反向代理服务器，同时也是一个 IMAP/POP3 代理服务器。

## 安装

### 根据包管理器安装

### 根据压缩包安装

## 配置

## 常用命令

1. 启动 Nginx

    - 启动 Nginx 服务

        ```bash
        sudo systemctl start nginx
        ```
  
    - 文件启动

        ```bash
        ./sbin/nginx # 在 Nginx 安装目录下执行
        ./sbin/nginx -c /path/to/nginx.conf # 指定配置文件启动
        ```

2. 停止 Nginx

    - 停止 Nginx 服务

        ```bash
        sudo systemctl stop nginx
        ```

    - 文件停止

        ```bash
        ./sbin/nginx -s stop # 在 Nginx 安装目录下执行
        ```

3. 验证配置文件

    - 验证 Nginx 配置文件是否正确

        ```bash
        sudo nginx -t
        ```

    - 或者在 Nginx 安装目录下执行

        ```bash
        ./sbin/nginx -t
        ```

4. 重启 Nginx

    - 重启 Nginx 服务

        ```bash
        sudo systemctl restart nginx
        ```

    - 文件重启

        ```bash
        ./sbin/nginx -s reload # 在 Nginx 安装目录下执行
        ```
