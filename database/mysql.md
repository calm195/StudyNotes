# 登录

1. 本地登录
>
> - `mysql -u root -p`
>   - `-u` ：指定用户名
>   - `-p` ：提示输入密码
>
2. 远程登录
>
> - `mysql -h host -u root -p -P port`
>   - `-h` ：指定主机
>   - `-u` ：指定用户名
>   - `-p` ：提示输入密码
>   - `-P` ：指定端口

# 插入

1. 插入数据
>
> - `insert into table_name (column1, column2, ...)
>    values (value1, value2, ...);`
>   - `table_name` ：表名
>   - `column1, column2, ...` ：列名
>   - `value1, value2, ...` ：值

# 更新

1. 更新数据
>
> - `update table_name set column1=value1, column2=value2, ...
>    where condition;`
>   - `table_name` ：表名
>   - `column1, column2, ...` ：列名
>   - `value1, value2, ...` ：值
>   - `condition` ：条件

# 删除

### 删除表

  1. 仅删除表中数据
  >
  > - `truncate` ：`truncate table table_name;`
  >   - 全部清空，整体删除，速度较快
  >   - 不写服务器log
  >   - 不触发trigger，但重置identity
  > - `delete` ：`delete * from table_name;`
  >   - 逐条删除，速度较慢
  >   - 写服务器log
  >   - 不重置identity，自增列继续往下数
  >
  2. 全部删除
  >
  > - `drop` ：`drop table table_name;`
  >   - 删除整个表，包括表结构
  >   - 无法恢复
  >   - 速度最快
  >   - 会触发trigger
  >   - 重置identity
  >
### 删除数据库
>
> - `drop` ：`drop database database_name;`
>   - 删除整个数据库，包括数据库中的表
>   - 无法恢复
>   - 速度最快
>   - 会触发trigger
>   - 重置identity
