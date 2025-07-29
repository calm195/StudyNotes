# ethtool

`ethtool` 是一个用于查询和控制网络接口的工具。

## 常用命令

1. 查看网卡驱动程序信息

   ```bash
   ethtool -i eth0
   ```

2. 查看网卡基本设置

   ```bash
   ethtool eth0
   ```

3. 设置网卡速率

   ```bash
   ethtool -s eth0 speed 100 duplex full
   ```

4. 网卡自检

    ```bash
    ethtool -t eth0
    ```

5. 查询网卡统计信息

    ```bash
    ethtool -S eth0
    ```

## 参数说明

- `-i`：显示驱动程序信息。
- `-s`：设置网卡参数。
- `speed`：设置网卡速率。
- `duplex`：设置双工模式。
- `up`：启用网卡。
- `down`：禁用网卡。
