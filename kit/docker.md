# docker

1. 基本配置

   - 创建用户组 `sudo groupadd docker`

   - 加入用户组 `sudo usermod -aG docker ${USER}`

   - 重启 docker `sudo systemctl restart docker`

   - 切换用户 `su root` `su ${User}`

2. 启动、重启、关闭服务

   - 启动 `systemctl start docker`

   - 守护进程重启 `sudo systemctl daeman-reload`

   - 重启 docker `systemctl restart docker` / `sudo service docker restart`

   - 关闭 docker `systemctl stop docker` / `sudo service docker stop`

3. 常用命令
   1. docker信息
      - 查看 docker 版本 `docker --version`
      - 查看 docker 信息 `docker info`

   2. 镜像
      - 拉取镜像 `docker pull ${image_name}:${tag}`
      - 查看 docker 镜像 `docker images`
      - 删除 docker 镜像 `docker rmi ${image_id}`

   3. 容器
      - 运行 docker 容器 `docker run -d -p 8080:80 --name ${container_name} ${image_name}:${tag}`
      - 查看 docker 容器 `docker ps -a`
      - 停止 docker 容器 `docker stop ${container_id}`
      - 删除 docker 容器 `docker rm ${container_id}`
      - 查看 docker 容器端口 `docker port ${container_id}`
      - 查看 docker 容器详细信息 `docker inspect ${container_id}`
