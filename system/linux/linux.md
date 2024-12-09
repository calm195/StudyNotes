# system info

1. 查看系统信息

    ```shell
    uname -a
    ```

2. 查看系统版本

    ```shell
    cat /etc/issue
    ```

3. 查看系统版本

    ```shell
    cat /etc/os-release
    ```

4. 查看支持的指令集

    ```shell
    cat /proc/cpuinfo
    ```

5. 查看内存信息

    ```shell
    cat /proc/meminfo
    ```

6. 查看磁盘信息

    ```shell
    df -h
    ```

# find

1. 查找文件
    - 直接查找

    ```shell
    find path -name file_name
    ```

    - 按类型查找

    ```shell
    find path -type f
    find path -type d
    find path -type l
    ```

    > - `f` ：文件
    > - `d` ：目录
    > - `l` ：链接
    - 按大小查找

    ```shell
    find path -size +10M
    find path -size -10M
    ```

    > - `+` ：大于
    > - `-` ：小于
    > - `k` ：KB
    > - `M` ：MB
    > - `G` ：GB
    > - `c` ：字节
    > - `b` ：块
    > - `w` ：字数
    - 按时间查找

    ```shell
    find path -mtime -1
    find path -mtime 1
    find path -mtime +1
    ```

    > - `-` ：小于
    > - `+` ：大于
    > - `mtime` ：修改时间
    > - `ctime` ：创建时间
    > - `atime` ：访问时间
2. 找并执行操作

    ```shell
    find path -name file_name -exec command {} \;
    ```

    > - `command` ：命令
    > - `{}` ：匹配到的文件名
    > - `\;` ：结束

# 更换源

1. 更换 `apt` 源
    - 备份

    ```shell
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    ```

    - 更换
        1. 没试过这个命令
    `sudo sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list`
        2. 手动更换 `sudo vim /etc/apt/sources.list`
        > 资源表
        > - aliyun
>
        >     ```shell
        >        deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
        >        deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
        >        deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
        >        deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
        >        # deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
        >        # deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
        >        # deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
        >        # deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
        >        ## Pre-released source, not recommended.
        >        # deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
        >        # deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
        > - tsinghua
>
        >     ```shell
        >       deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
        >       deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
        >       deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
        >       deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
        >       # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
        >       # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
        >       # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
        >       # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
        >       ## Pre-released source, not recommended.
        >       # deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
        >       # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
        > - ustc
>
        >     ```shell
        >       deb https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse
        >       deb https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
        >       deb https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
        >       deb https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse
        >       # deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse
        >       # deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
        >       # deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
        >       # deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse
        >       ## Pre-released source, not recommended.
        >       # deb https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
        >       # deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse

    - 更新 `sudo apt update`
