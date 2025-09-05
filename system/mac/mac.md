1. 安装 brew 提示 Failed to connect to `raw.githubusercontent.com`
    
    - 问题描述：在安装 `brew` 时，提示 `Failed to connect to raw.githubusercontent.com port 443: Operation timed out`
    - 解决方法：修改 `hosts` 文件
    
        ```shell
        sudo vim /etc/hosts
        ```
    
        在文件末尾添加
    
        ```shell
        ip raw.githubusercontent.com
        ```
    
        > ip 可以通过 `ping raw.githubusercontent.com` 获取
        > 或者 [ipaddress.com](https://www.ipaddress.com/) 查询
    - 保存退出后，再次执行 `brew` 安装命令即可
