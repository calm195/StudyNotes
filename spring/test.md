# Spring Test

Spring框架下的测试模块

## 配置依赖

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>
```

## 常用注解

`@SpringBootTest`：启动Spring Boot应用上下文

- `webEnvironment`：指定启动环境
  - `MOCK`：模拟环境，不监听端口，内嵌的Servlet容器不会启动
  - `RANDOM_PORT`：随机端口，内嵌的Servlet容器会启动
  - `DEFINED_PORT`：指定端口，从配置中读取，内嵌的Servlet容器会启动
  - `NONE`：启动一个非web的ApplicationContex，不启动web环境，不监听端口
- `properties`：指定配置属性
- `classes`：指定配置类
- `value`：指定配置属性

`@RunWith`：指定测试运行器，JUnit的注解，关联Spring Boot Test，运行JUnit同时启动Spring。

1. 配置类型的注解
   - `@TestConfiguration`：指定某个配置类专用于测试
   - `@OverrideAutoConfiguration`：覆盖自动配置
     - ImportAutoConfiguration：导入自动配置
2. mock类型的注解
   - `@MockBean`：模拟bean，全新的对象跟正式对象没有关系
   - `@SpyBean`：spy bean，spy对象会保留原有对象的行为
   - `@MockBeans`：使@MockBean支持在同一类型或属性上多次出现
   - `@SpyBeans`：使@SpyBean支持在同一类型或属性上多次出现
3. 自动配置类型的注解
   - `@AutoConfigure*`：自动配置
   - `Jdbc`：自动配置JDBC
   - `Cache`：自动配置缓存
   - `WebClient`：自动配置WebClient
4. 启动测试类型的注解
所有的测试类必须声明一个`@*Test`注解，否则无法启动测试。所有的`@*Test`注解都被`@BootstrapWith`注解引用，可以启动ApplicationContext。
   - `@SpringBootTest`：自动侦测并加载`@SpringBootConfiguration`和`@SpringBootApplication`注解的类，默认web环境为`WebEnvironment.MOCK`，不监听任务端口
   - `@DataJpaTest`：测试基于JPA的数据访问层，同时提供TestEntityManager代替JPA的EntityManager
   - `@DataJdbcTest`：测试基于JDBC的数据访问层
   - `@DataRedisTest`：测试Redis操作，自动扫描被`@RedisHash`注解的类，并配置`Spring Data Redis`的库。
