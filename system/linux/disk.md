# disk

Linux 磁盘相关命令

一些缩写：

- `LV`：逻辑卷（Logical Volume）
- `VG`：卷组（Volume Group）
- `PV`：物理卷（Physical Volume）

## 查看磁盘信息

1. 查看磁盘分区信息

    ```bash
    fdisk -l
    ```

2. 查看磁盘使用情况

    ```bash
    df -h # 文件系统的磁盘空间使用情况
    du -sh /mnt  # 查看挂载点的磁盘使用情况
    ```

## 磁盘分区

1. 使用 fdisk 对磁盘进行分区

    ```bash
    fdisk /dev/sdX  # 替换 sdX 为实际的磁盘标识符
    ```

2. 磁盘格式化

    ```bash
    mkfs.ext4 /dev/sdX1  # 替换 sdX1 为实际的分区标识符
    mkfs -t ext4 /dev/sdX1  # 替换 sdX1 为实际的分区标识符
    ```

## 挂载和卸载

1. 挂载分区

    ```bash
    mount /dev/sdX1 /mnt  # 替换 sdX1 为实际的分区标识符，/mnt 为挂载点
    ```

2. 卸载分区

    ```bash
    umount /mnt  # 替换 /mnt 为实际的挂载点
    ```

## 开机自动挂载

1. 查看磁盘格式与UUID

    ```bash
    blkid /dev/sdX1  # 替换 sdX1 为实际的分区标识符
    ```

2. 编辑 `/etc/fstab` 文件，添加以下行：

    ```fstab
    UUID=<UUID>  /mnt  ext4  defaults  0  1
    /dev/sdX1  /mnt  ext4  defaults  0  1
    ```
