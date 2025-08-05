# postgresql

PostgreSQL是一个强大的开源关系数据库管理系统。

## 安装

### Ubuntu/Debian

```bash
sudo apt update
sudo apt install postgresql
```

## 配置

### 用户

1. 命令行模式

    创建数据库用户

    ```bash
    sudo -u postgres createuser --superuser myuser
    ```

    登录控制台

    ```bash
    sudo -u postgres psql
    ```

    修改用户密码

    ```sql
    \password myuser
    ```

    回到命令行创建数据库

    ```bash
    sudo -u postgres createdb -O myuser mydb
    ```

2. 使用`psql`命令行工具

    初次安装后，PostgreSQL会创建一个名为`postgres`的数据库用户与数据库，并且创建了`postgres`操作系统账户。你可以使用以下命令切换到该用户：

    ```bash
    sudo -i -u postgres
    ```

    切换到`postgres`用户后，你可以进入PostgreSQL命令行界面：

    ```bash
    psql
    # 如果不切换用户，可以直接使用以下命令连接到PostgreSQL：
    psql -U postgres -d postgres -h localhost -p 5432
    ```

    从而修改密码并且创建新的数据库用户和数据库：

    ```sql
    -- 修改postgres用户密码
    \password postgres
    -- 创建新用户和数据库
    CREATE USER myuser WITH PASSWORD 'mypassword';
    CREATE DATABASE mydb OWNER myuser;
    ```

    > 当操作系统用户与PostgreSQL用户同名时，可以直接使用`psql`命令而无需切换用户。

### 修改配置文件

PostgreSQL的主配置文件通常位于`/etc/postgresql/<version>/main/postgresql.conf`。你可以编辑此文件来修改数据库的设置，例如监听地址、端口等。

```conf
listen_addresses = '*'
port = 5432
```

同时，你可能还需要修改`/etc/postgresql/<version>/main/pg_hba.conf`文件来配置客户端认证方式。

```conf
# Type  Database        User            Address                 Method
host    all             all             0.0.0.0/0               md5
```
