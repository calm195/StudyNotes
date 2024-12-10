# Spring Cache

Spring Cache是Spring框架下的缓存模块，提供了对缓存的支持。

## 配置

缓存注解依赖

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-cache</artifactId>
</dependency>
```

具体实现依赖，如`Caffeine`、`Ehcache`等。

```xml
<dependency>
    <groupId>com.github.ben-manes.caffeine</groupId>
    <artifactId>caffeine</artifactId>
</dependency>
```

## 常用注解

- `@Cacheable` 缓存注解，执行前先查看缓存中是否有数据，如果有则直接返回缓存中的数据，否则执行方法并将结果缓存。
  > 可以用于修饰方法和类
  - `cacheNames` 缓存名称
  - `key` 缓存的key，支持SpEL表达式
  - `condition` 满足条件时写入缓存
  - `unless` 不满足条件时写入缓存
- `@CachePut` 更新缓存，用于标记方法执行后更新缓存。
- `@CacheEvict` 失效缓存，用于标记方法执行后清除缓存。
- `@Caching` 组合多个缓存注解。
  - `cacheable`
  - `put`
  - `evict`

## 配置设置

- `@EnableCaching` 开启缓存支持
- `@CacheConfig` 配置缓存的公共属性
  - `cacheNames` 缓存名称
  - `keyGenerator` key生成器
  - `cacheManager` 缓存管理器
  - `cacheResolver` 缓存解析器

1. 在配置文件中配置缓存时间等属性。
2. 在类文件中配置缓存时间等属性。
