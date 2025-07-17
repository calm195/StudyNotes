# maven command

## 常用命令

```bash
# 编译项目，编译生成的class文件会放在target/classes目录下
mvn compile

# 运行项目中所有的测试用例
mvn test

# 根据pom配置文件打包项目
mvn package

# 将项目构建并且安装到本地仓库
mvn install

# 将最终的项目构建复制到远程仓库中
mvn deploy

# 清理target目录，删除编译构建生成的文件
mvn clean
```

## 依赖管理命令

```bash
# 更新本地仓库中的依赖
mvn dependency:resolve
# 查看项目的依赖树
mvn dependency:tree
# 查看项目的依赖列表
mvn dependency:list
# 下载依赖源代码
mvn dependency:sources
# 分析依赖
mvn dependency:analyze
```
