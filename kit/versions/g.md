# g

全平台go版本管理工具

## 命令

1. `g list`：列出所有可安装的go版本
2. `g install <version>`：安装指定版本的go
3. `g use <version>`：使用指定版本的go
4. `g uninstall <version>`：卸载指定版本的go
5. `g ls`：列出所有已安装的go版本
6. `g ls-remote`：列出所有可安装的go版本

## 各系统安装

1. windows

   在[g官网](<https://github.com/voidint/g>)上下载release，解压在本地，然后添加环境变量。~~ps: 需要删除存在的go环境变量~~

   `G_HOME`:`*/g/` 是g.exe所在的目录
   `GOROOT`: `%G_HOME%/go/`

   用户变量可以新增`G_MIRROR`:`https://golang.google.cn/dl` 以便更快下载go

2. linux

3. mac
