# `@Async`

异步方法执行注解，标记一个方法为异步执行或者标记一个类中的`public`方法为异步执行。
当被`@Async`注解的方法被调用时，Spring将创建一个异步代理对象执行该方法。

注意事项：

1. 使用`@Async`注解时，需要在配置类上添加`@EnableAsync`注解来启用异步方法执行。
2. `@Async`注解只能应用于`public`方法。
3. 该注解只能应用于Spring管理的Bean中，通过代理对象调用，直接调用无效。

## 参数

`@Async`注解可以接收一个`String`类型的参数，表示要使用的线程池的名称。如果不指定，Spring将使用默认的线程池。

```java
@Async("customThreadPool")
public CompletableFuture<String> asyncMethod() {
    // 异步执行的逻辑
}
```
