# scp

scp is a command-line utility for securely copying files and directories between hosts on a network. It uses SSH (Secure Shell) for data transfer and provides the same authentication and security as SSH.

## 基本用法

1. 从本地复制文件到远程主机

    ```shell
    scp local_file user@remote_host:/remote/directory/
    ```

2. 从远程主机复制文件到本地

    ```shell
    scp user@remote_host:/remote/file local_directory/
    ```

3. 复制整个目录

    ```shell
    scp -r local_directory user@remote_host:/remote/directory/
    ```
