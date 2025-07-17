# pom.xml

常见的maven依赖配置

## dependency

```xml
<dependency>
    <groupId>group-id</groupId>
    <artifactId>artifact-id</artifactId>
    <version>version</version>
</dependency>
```

## distributionManagement

用于定义项目的发布管理信息，指定发布的仓库地址。
通常包括发布仓库和快照仓库。

```xml
<distributionManagement>
    <repository>
        <id>internal-repo</id>
        <url>http://internal.repo/repository/maven-releases</url>
    </repository>
    <snapshotRepository>
        <id>internal-snapshots</id>
        <url>http://internal.repo/repository/maven-snapshots</url>
    </snapshotRepository>
</distributionManagement>
```

一般来说，`distributionManagement`中的仓库地址需要认证访问。而认证信息会存储在`settings.xml`中。

```xml
<servers>
    <server>
        <id>internal-repo</id>
        <username>your-username</username>
        <password>your-password</password>
    </server>
    <server>
        <id>internal-snapshots</id>
        <username>your-username</username>
        <password>your-password</password>
    </server>
</servers>
```
