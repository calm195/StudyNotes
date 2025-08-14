# Lua

Lua是一种用C语言编写的脚本语言，具有轻量级、可扩展和高效的特点。它被广泛应用于游戏开发、嵌入式系统和Web应用等领域。

## 安装

1. 源码安装

   ```bash
    curl -L -R -O https://www.lua.org/ftp/lua-5.4.8.tar.gz
    tar zxf lua-5.4.8.tar.gz
    cd lua-5.4.8
    make all test
    make install
    ```

2. 使用包管理器安装

   - 在Ubuntu上：

   ```bash
    sudo apt-get install lua5.4
   ```

   - 在CentOS上：

   ```bash
    sudo yum install lua
   ```

   - 在macOS上：

   ```bash
    brew install lua@5.4
   ```

## 基础语法

```lua
-- 单行注释
-- [[
    多行注释
-- ]]
type(val) -- 获取变量类型，返回变量类型字符串
print(#string_val) -- # 获取字符串长度
a = 5 -- 全局变量
local b = 10 -- 局部变量
a, b = 0, 1, 2 -- 2将被忽略
a, b, c = 1, 2 -- c将赋值为nil
site = {}
site["key"] = "value"
print(site["key"])
print(site.key) -- 如果key是字符串可以简写
```

## 数据类型

| 数据类型 | 描述 |
| -------- | ---- |
| nil     | 表示无值或空值 |
| boolean | 布尔值，true或false |
| number  | 数字，可以是整数或浮点数 |
| string  | 字符串，由一系列字符组成 |
| table   | 表，类似于Map，可以用来表示数组、字典等，表示数组时，索引从1开始；自动扩容 |
| function| 函数，可以作为变量传递 |
| userdata| 用户数据，允许用户定义自己的数据类型 |
| thread  | 线程，Lua中的轻量级线程 |
