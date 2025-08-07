# mysql

## my.cnf

- `/etc/my.cnf`：Linux系统的MySQL配置文件
- `/etc/mysql/my.cnf`：Debian/Ubuntu系统的MySQL配置文件
- `/etc/mysql/mysql.conf.d/mysqld.cnf`：Ubuntu 18.04及以上版本的MySQL配置文件

相关配置：

```ini
[mysqld]  
datadir=/var/lib/mysql
socket=/var/run/mysqld/mysqld.sock
user=mysql
bind-address=0.0.0.0 # 允许所有IP访问
port=3306 # MySQL默认端口
```

## 登录

- 第一次登录使用默认的root用户和空密码 `sudo mysql`
- 本地登录
  - `mysql -u root -p`
    - `-u` ：指定用户名
    - `-p` ：提示输入密码
- 远程登录
  - `mysql -h host -u root -p password -P port`
    - `-h` ：指定主机
    - `-u` ：指定用户名
    - `-p` ：提示输入密码
    - `-P` ：指定端口

## 修改密码

- `set password for user@localhost = password('new_password');`
  - `user` ：用户名
  - `localhost` ：主机名
  - `new_password` ：新密码
- `mysqladmin -uuser -poldPassword password newPassword`
- `update mysql.user set password=password('newPassword') where user='user';`

mysql 8.0 版本以上：

修改root用户密码：

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new_password';
```

## 创建用户

- `create user 'user'@'localhost' identified by 'password';`
  - `user` ：用户名
  - `localhost` ：主机名
  - `password` ：密码

## 授权

- `grant all privileges on database_name.table_name to 'user'@'localhost';`
  - `database_name` ：数据库名
  - `user` ：用户名
  - `localhost` ：主机名
  - `all privileges` ：授予所有权限
    - `select` ：查询权限
    - `insert` ：插入权限
  - `*` ：表示所有表

## 数据迁移

### 导出数据

- `mysqldump -u user -p database_name > backup.sql`
  - `user` ：用户名
  - `database_name` ：数据库名
  - `backup.sql` ：导出文件名
- `mysqldump -u user -p --databases db1 db2 > backup.sql`
  - `db1 db2` ：多个数据库名
- `mysqldump -u user -p --tables db_name table1 table2 > backup.sql`
  - `table1 table2` ：多个表名

### 导入数据

- `mysql -u user -p database_name < backup.sql`
  - `user` ：用户名
  - `database_name` ：数据库名
  - `backup.sql` ：导入文件名
- `mysql -u user -p < backup.sql`
  - `user` ：用户名

## 插入

- `insert into table_name (column- column- ...)
  values (value- value- ...);`
  - `table_name` ：表名
  - `column- column- ...` ：列名
  - `value- value- ...` ：值

## 更新

- `update table_name set column-value- column-value- ...
   where condition;`
  - `table_name` ：表名
  - `column- column- ...` ：列名
  - `value- value- ...` ：值
  - `condition` ：条件

## 删除

- 仅删除表中数据
  - `truncate` ：`truncate table table_name;`
    - 全部清空，整体删除，速度较快
    - 不写服务器log
    - 不触发trigger，但重置identity
  - `delete` ：`delete * from table_name;`
    - 逐条删除，速度较慢
    - 写服务器log
    - 不重置identity，自增列继续往下数
- 全部删除
  - `drop` ：`drop table table_name;`
    - 删除整个表，包括表结构
    - 无法恢复
    - 速度最快
    - 会触发trigger
    - 重置identity
- `drop` ：`drop database database_name;`
  - 删除整个数据库，包括数据库中的表
  - 无法恢复
  - 速度最快
  - 会触发trigger
  - 重置identity
