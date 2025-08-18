# struct

go的结构体

## 声明

```go
type Person struct {
    Name string
    Age  int
}
```

## tag

结构体在编译阶段关联到成员的元信息字符串，运行时通过反射读取。

格式如下：

```go
`key1:"value1" key2:"value2" ...`
```

key会指定标签的解析方式

- `json`: json序列化时使用的字段名
  - `json:"name"`: 编码后字段为Name
  - `json:"-"`: 忽略该字段
  - `json:"name,omitempty"`: 仅在字段不为空时编码
  - `json:"name, type"`: 指定字段的类型
- `orm`: Beego标签
- `gorm`: GORM标签
  - `gorm:"column:name"`: 指定数据库表字段名
  - `gorm:"type:varchar(100)"`: 指定字段类型
  - `gorm:"primary_key"`: 指定主键
  - `gorm:"auto_increment"`: 指定自增
  - `gorm:"index"`: 指定索引
  - `gorm:"unique"`: 指定唯一索引
  - `gorm:"size:255"`: 指定字段大小
  - `gorm:"not null"`: 指定非空
  - `gorm:"default:'unknown'"`: 指定默认值
  - `gorm:"<-"`: 写入的权限
    - `gorm:"<-:create"`: 允许创建
    - `gorm:"<-:update"`: 允许更新
  - `gorm:"->"`: 读的权限
  - `gorm:"comment"`: 字段注释
- `xorm`: XORM标签
- `bson`: MongoDB标签
- `form`: 表单标签, Gin中将表单数据绑定到结构体
  - `form:"name"`: 表单字段名
  - `form:"-"`: 忽略该字段
- `binding`: 表单验证标签
    - `binding:"required"`: 必填字段
    - `binding:"max=10"`: 最大值
    - `binding:"min=1"`: 最小值
    - `binding:"len=5"`: 长度为5
    - `binding:"email"`: 邮箱格式
    - `binding:"url"`: URL格式
    - `binding:"uuid"`: UUID格式
    - `binding:"eq=FieldName"`: 等于另一个字段
    - `binding:"ne=FieldName"`: 不等于另一个字段
    - `binding:"gt=FieldName"`: 大于另一个字段
    - `binding:"gte=FieldName"`: 大于等于另一个字段
    - `binding:"lt=FieldName"`: 小于另一个字段
    - `binding:"lte=FieldName"`: 小于等于另一个字段
    - `binding:"oneof=val1 val2 val3"`: 值必须是指定值之一
