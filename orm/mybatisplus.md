# baomidou MybatisPlus

[mybatis-plus](https://github.com/baomidou/mybatis-plus) 是一个 MyBatis 的增强工具，在 MyBatis 的基础上只做增强不做改变，为简化开发、提高效率而生。

依赖：

```xml
<dependency>
    <groupId>com.baomidou</groupId>
    <artifactId>mybatis-plus-boot-starter</artifactId>
    <version>3.4.3</version>
</dependency>
```

配置：

```yaml
mybatis-plus:
    configuration:
        log-impl: org.apache.ibatis.logging.stdout.StdOutImpl # 日志输出
    global-config:
        db-config:
            logic-delete-value: 1 # 逻辑删除后的字段
            logic-not-delete-value: 0 # 逻辑删除前的字段
            logic-delete-field: deleted # 逻辑删除字段，对应实体类的字段，写了这个实体类就不用写逻辑删除注解
```

## 条件构造器

条件构造器是 MybatisPlus 的核心功能，用于构建查询条件。

![wrapper](../image/LambdaQueryWrapper-func.png)

| 方法名 | 作用 |
| --- | --- |
| `eq` | 等于 |
| `ne` | 不等于 |
| `gt` | 大于 |
| `ge` | 大于等于 |
| `lt` | 小于 |
| `le` | 小于等于 |
| `between` | `xxx between a and b` |
| `like` | `like %s%` |
| `notLike` | `not like %s%` |
| `likeLeft` | `like %s` |
| `likeRight` | `like s%` |
| `in` | `xxx in (a, b, c)` |
| `notIn` | `xxx not in (a, b, c)` |
| `inSql` | `xxx in (select id from table where ...)` |
| `notInSql` | `xxx not in sql` |
| `isNull` | `xxx is null` |
| `isNotNull` | `xxx is not null` |

- `QueryWrapper`：条件构造器，基于String
- `LambdaQueryWrapper`：Lambda 条件构造器，基于方法引用
- `UpdateWrapper`：更新条件构造器
- `LambdaUpdateWrapper`：Lambda 更新条件构造器

## 通用CURD

MybatisPlus 提供了通用的 CRUD 方法，可以直接调用。

1. 基于Service CRUD。dao类需要继承`ServiceImpl<M extends BaseMapper<T>, T> implements IService<T>`。
2. 基于Mapper CRUD。需要定义Mapper接口 继承`BaseMapper<T>`。

`BaseMapper`提供的方法有：

| 方法名 | 作用 |
| --- | --- |
| `int insert(T entity)` | 插入一条记录 |
| `int delete(@Param(Constants.WRAPPER) Wrapper<T> wrapper)` | 根据 entity 条件，删除记录 |
| `int deleteById(Serializable id)` | 根据 ID 删除记录 |
| `int update(@Param(Constants.ENTITY) T entity, @Param(Constants.WRAPPER) Wrapper<T> updateWrapper)` | 根据 whereEntity 条件，更新记录 |
| `int updateById(@Param(Constants.ENTITY) T entity)` | 根据 ID 更新记录 |
| `T selectById(Serializable id)` | 根据 ID 查询 |
| `List<T> selectList(@Param(Constants.WRAPPER) Wrapper<T> queryWrapper)` | 查询列表 |

## 常用注解

- `@TableName`：表名注解
  - `value`：表名
  - `schema`：数据库 schema
  - `keepGlobalPrefix`：是否保持全局的表前缀
- `@TableField`：字段注解
  - `value`：字段名
  - `exist`：是否为数据库字段
  - `condition`：字段筛选条件，where 条件
  - `update`：更新字段，update set
  - `fill`：字段自动填充
    - `FieldFill.INSERT`：第一次插入时填充
    - `FieldFill.UPDATE`：更新时填充
    - `FieldFill.INSERT_UPDATE`：插入和更新时填充
- `@TableId`：主键注解
  - `value`：主键字段名
  - `type`：主键类型
    - `IdType.AUTO`：数据库自增，雪花算法，自行注入的ID会被自动生成的ID覆盖；自动生成的ID会回填到java对象中
    - `IdType.INPUT`：数据库自增，雪花算法，但自行注入的ID覆盖自动生成的ID；自动生成的ID不会回填到java对象中
    - `IdType.NONE`：无状态，跟随全局，雪花算法实现
    - `IdType.ASSIGN_ID`：MP 自带的分配 ID 策略
    - `IdType.ASSIGN_UUID`：分配 UUID 策略
- `@Version`：乐观锁注解
  - 乐观锁字段，类型为 int/Integer
  - 乐观锁字段在更新时会自动 +1
- `@TableLogic`：逻辑删除注解
  - 在配置文件中配置逻辑删除属性
