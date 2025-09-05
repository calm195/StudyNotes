# Redis ACL

**Redis 6.0**版本之后的权限管理工具

> Redis有一个默认的`default`用户，拥有所有权限，并且默认不需要密码

## 持久化配置

需要在`redis.conf`中配置`aclfile`，这样使用`acl save`命令才能正常运行保存，同时使用`acl load`命令才可以正常读取用户名密码。

```ini
aclfile /path/to/users.acl
```

## 命令分类

使用`acl cat`可以列出所有的命令分类。

`acl cat category_name`可以列出该分类下所有命令

## 用户管理

| 命令                                | 含义                   |
| ----------------------------------- | ---------------------- |
| `acl deluser user1 user2`           | 删除用户               |
| `acl getuser user1`                 | 获取用户的详细信息     |
| `acl list`                          | 获取所有用户的详细信息 |
| `acl users`                         | 获取所有用户名         |
| `acl whoami`                        | 获取当前用户的名字     |
| `acl setuser user rule1 [rule2]...` | 创建或配置用户         |

`acl setuser`详解：

`acl setuser user on >123 ~* &* +@all`这条配置中

- `user` 用户名

- `on` 启用用户

- `>123` 设置用户密码，明文输入加密存储`SHA1`

    - 一个用户可以同时设置多个密码
    - 只需要匹配一个密码即可

- `~*` key限制

    - 支持`*`通配符
    - 读`w`写`r`

    > 只读`app`：`%R~app`
    >
    > `app`开头的所有权限：`~app*`

- `&*` pub/sub限制

    - 需要能够使用`pub`，`sub`命令
    - `allchannels`允许所有权限
    - `resetchannels`取消所有权限

- `+@all` 允许执行所有命令

    - `+`增加命令权限
    - `-`减少命令权限

    > `-get`：撤销get命令
    >
    > `+@hash`：可以执行所有Hash类的命令

