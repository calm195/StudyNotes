# vim

## 命令作用基本规则

三部分结构：操作符-对象范围-对象

1. 操作符
   - `d` 删除
   - `c` 修改
   - `y` 复制
   - `v` 可视化选择
   - `g` 扩展功能
2. 对象范围
   - `i` 内部
   - `a` 外部
3. 对象
   - `w` 单词
   - `s` 句子
   - `p` 段落
   - `t` 标签
   - `b` 块
   - `B` 块，包含(){}[]
   - `"` 引号
   - `'` 单引号
   - `<>` 尖括号

## 查找

- `/`：向下查找
- `?`：向上查找
- `n`：下一个
- `N`：上一个
- `*`：向下查找光标所在的单词
- `g*`：向下查找光标所在的单词，不考虑单词边界

## 替换

- `:{range}s/{pattern}/{string}/{flags}`：替换
  - `{range}`：范围
    - `.`：当前行 //或者空
    - `n`：第 n 行
    - `n,m`：n 到 m 行
    - `%`：所有行
    - `'<,'>`：可视化选择的行，可视化模式下默认添加
    - `,`：与
  - `{pattern}`：查找的内容
  - `{string}`：替换的内容
  - `{flags}`：标志
    - `g`：全局替换
    - `c`：需要确认替换
    - `i`：忽略大小写
    - `I`：不忽略大小写
    - `n`：不替换，只显示匹配行数
    - `&`：重复上次替换

## 翻页

> forward 向前，backward 向后
> up 向上，down 向下
> top 顶部，bottom 底部

- `Ctrl + f`：向下翻页
- `Ctrl + b`：向上翻页
- `Ctrl + d`：向下翻半页
- `Ctrl + u`：向上翻半页
- `Ctrl + e`：向下滚动一行
- `Ctrl + y`：向上滚动一行
- `zz`：将当前行置于屏幕中间
- `zt`：将当前行置于屏幕顶部
- `zb`：将当前行置于屏幕底部

## 标记 - mark

- `m{a-zA-Z}`：标记当前位置，`{a-zA-Z}` 为标记名
- `'`：跳转到上次编辑的地方
- `'?`：跳转到指定标记?所在行的首个非空字符
- `'.`：跳转到最后一次编辑的地方
- `:marks`：查看所有标记
  - `.`：最后一次编辑的地方
  - `^`：上次插入的地方
  - `0-9`：最近使用的文件
  - `'`：上次跳转前的位置
  - `"`：上次退出的位置
  - `[`：上次修改的开始位置
  - `]`：上次修改的结束位置
- `:delmarks a`：删除标记 `a`
- `:delmarks!`：删除所有标记

## 缩进

1. `=`：自动缩进
   - `==`：自动缩进当前行
   - `gg=G`：自动缩进整个文件
   - `={motion}`：自动缩进指定范围，motion 为任意移动光标的动作
      - `=a{`：自动缩进当前块
      - `=i{`：自动缩进当前块内部
2. `> & <`：手动缩进
   - `>>`：向右缩进当前行
   - `<<`：向左缩进当前行
   - `>{motion}`：向右缩进指定范围
   - `<{motion}`：向左缩进指定范围
      - `>a{`：向右缩进当前块
      - `<a{`：向左缩进当前块
      - `>i{`：向右缩进当前块内部
      - `<i{`：向左缩进当前块内部

## 不常用但有用的命令

- `:set nu`：显示行号
- `:set nonu`：不显示行号
- `gg`：跳转到文件开头
- `G`：跳转到文件结尾
- `+y`：选中内容复制到+寄存器即系统剪贴板
- 大小写转化：`gu` 小写，`gU` 大写

1. `w !{cmd}`：将当前行的内容作为标准输入传递给命令 `{cmd}`，并将命令的输出替换当前行的内容
   > 直接保存权限不足的文件 `xw ! sudo tee %`
   > `tee` 用于将标准输入的内容写入文件，`%` 代表当前文件名
