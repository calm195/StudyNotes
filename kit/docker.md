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
      - 创建 docker 容器 `docker build -t ${image_name}:${tag} /path/to/Dockerfile`
      - 运行 docker 容器 `docker run -d -p container_host:container_port:host_port --name ${container_name} ${image_name}:${tag}`
      - 查看 docker 容器 `docker ps -a`
      - 停止 docker 容器 `docker stop ${container_id}`
      - 删除 docker 容器 `docker rm ${container_id}`
      - 查看 docker 容器端口 `docker port ${container_id}`
      - 查看 docker 容器详细信息 `docker inspect ${container_id}`

## 国内镜像

编辑 `/etc/docker/daemon.json` 文件，添加以下内容：

```json
{
  "registry-mirrors" : [
      "https://docker.registry.cyou",
      "https://docker-cf.registry.cyou",
      "https://dockercf.jsdelivr.fyi",
      "https://docker.jsdelivr.fyi",
      "https://dockertest.jsdelivr.fyi",
      "https://mirror.aliyuncs.com",
      "https://dockerproxy.com",
      "https://mirror.baidubce.com",
      "https://docker.m.daocloud.io",
      "https://docker.nju.edu.cn",
      "https://docker.mirrors.sjtug.sjtu.edu.cn",
      "https://docker.mirrors.ustc.edu.cn",
      "https://mirror.iscas.ac.cn",
      "https://docker.rainbond.cc",
      "https://do.nark.eu.org",
      "https://dc.j8.work",
      "https://dockerproxy.com",
      "https://gst6rzl9.mirror.aliyuncs.com",
      "https://registry.docker-cn.com",
      "http://hub-mirror.c.163.com",
      "http://mirrors.ustc.edu.cn/",
      "https://mirrors.tuna.tsinghua.edu.cn/",
      "http://mirrors.sohu.com/" 
      ],
      "insecure-registries" : [
         "registry.docker-cn.com",
         "docker.mirrors.ustc.edu.cn"
      ],
      "debug": true,
      "experimental": false
}
```
