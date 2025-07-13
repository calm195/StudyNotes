# mysql

## 登录

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
