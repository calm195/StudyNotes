# mysql xa

mysql xa 实现

## 命令

```sql
# 开启分支事务
XA START/BEGIN 'xid'

# 完成SQL操作，不提交不回滚
XA END 'xid'

# 预提交，锁定资源等
XA PREPARE 'xid'

# 提交
XA COMMIT 'xid'

# 回滚
XA ROLLBACK 'xid'

# 列出所有准备好但未提交的事务分支
XA RECOVER
```
