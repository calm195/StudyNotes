# scp

1. 上传文件

    ```shell
    scp local_file remote_username@remote_ip:remote_folder
    ```

2. 下载文件

    ```shell
    scp remote_username@remote_ip:remote_file local_folder
    ```

3. 上传文件夹

    ```shell
    scp -r local_folder remote_username@remote_ip:remote_folder
    ```

4. 下载文件夹

    ```shell
    scp -r remote_username@remote_ip:remote_folder local_folder
    ```
