# Reactor

Reactor是一个用于构建异步和事件驱动的应用程序的框架。它提供了一个响应式编程模型，允许开发者处理数据流和事件流。
[Reactor官网](https://projectreactor.io/) [github仓库](https://github.com/reactor/)

Reactor的核心概念是`Publisher`和`Subscriber`。`Publisher`是一个数据源，它可以发布数据流，而`Subscriber`是一个接收数据流的消费者。

## Maven依赖

要在Maven项目中使用Reactor，可以添加以下依赖：

```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>io.projectreactor</groupId>
            <artifactId>reactor-bom</artifactId>
            <version>2024.0.6</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>

<dependencies>
    <dependency>
        <groupId>io.projectreactor</groupId>
        <artifactId>reactor-core</artifactId>
    </dependency>
    <dependency>
        <groupId>io.projectreactor</groupId>
        <artifactId>reactor-test</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
```

## Mono

`Mono`是Reactor中的一个Publisher，它表示一个可能包含0或1个元素的异步序列。它通常用于表示单个值的异步计算。

**创建 Mono的静态方法**：

1. `Mono.just(T data)`：创建一个包含指定数据的Mono。
2. `Mono.justOrEmpty(Optional<T> optional)`：从一个Optional创建Mono，如果Optional为空则返回空的Mono。
3. `Mono.delay(Duration delay)`：创建一个在指定延迟后发射数据的Mono。
4. `Mono.ignoreElement()`：创建一个忽略元素的Mono。
5. `Mono.fromCallable(Callable<? extends T> callable)`：从一个可调用对象创建Mono。
6. `Mono.fromSupplier(Supplier<? extends T> supplier)`：从一个供应者创建Mono。
7. `Mono.fromFuture(Future<? extends T> future)`：从一个Future创建Mono。
8. `Mono.fromRunnable(Runnable runnable)`：从一个Runnable创建Mono。
9. `Mono.empty()`：创建一个空的Mono。
10. `Mono.error(Throwable error)`：创建一个发射错误的Mono。
11. `Mono.never()`：创建一个永不发射数据的Mono。

## Flux

`Flux`是Reactor中的一个Publisher，它表示一个可能包含0到N个元素的异步序列。它通常用于表示多个值的异步计算。

**创建 Flux的静态方法**：

1. `Flux.just(T... data)`：创建一个包含指定数据的Flux。
2. `Flux.fromIterable(Iterable<? extends T> it)`：从一个可迭代对象创建Flux。
3. `Flux.fromArray(T[] array)`：从一个数组创建Flux。
4. `Flux.fromStream(Stream<? extends T> stream)`：从一个Stream创建Flux。
5. `Flux.range(int start, int count)`：创建一个包含指定范围内整数的Flux。
6. `Flux.interval(Duration period)`：创建一个定时发射整数的Flux。
7. `Flux.empty()`：创建一个空的Flux。
8. `Flux.error(Throwable error)`：创建一个发射错误的Flux。
9. `Flux.never()`：创建一个永不发射数据的Flux。

**创建Flux的动态方法**：

1. `Flux.generate(Supplier<T> supplier)`：使用提供的Supplier生成Flux。
2. `Flux.create(Consumer<SynchronousSink<T>> sinkConsumer)`：使用提供的Consumer创建Flux。

## 常用方法

|方法 | 描述 |
|---|---|
| `zipWith(Publisher<? extends T2>, BiFunction<? super T, ? super T2, ? extends R> combinator)` | 将两个Publisher的元素组合成一个新的Publisher。 |
| `take(long n)` | 只取前n个元素。 |
| `take(Duration duration)` | 在指定时间内只取元素。 |
| `takeLast(long n)` | 只取最后n个元素。 |
| `takeUntil(Predicate<? super T> predicate)` | 直到满足条件时停止取元素。 |
| `takeUntilOther(Publisher<?> other)` | 直到另一个Publisher发射数据时停止取元素。 |
| `takeWhile(Predicate<? super T> predicate)` | 只取满足条件的元素。 |
| `reduce(BiFunction<T, T, T> accumulator)` | 将元素累积成一个单一的值。 |
| `reduceWith(Supplier<R> initialSupplier, BiFunction<R, T, R> accumulator)` | 使用初始值和累加器将元素累积成一个单一的值。 |
| `merge(Publisher<? extends T> other)` | 按时间顺序将当前Publisher和另一个Publisher合并成一个新的Publisher。 |
| `mergeSequential(Publisher<? extends T> other)` | 按序列顺序合并当前Publisher和另一个Publisher。 |
| `flatMap(Function<? super T, ? extends Publisher<? extends R>> mapper)` | 将每个元素映射到一个Publisher，并将所有Publisher的结果合并成一个新的Publisher。 |
| `flatMapSequential(Function<? super T, ? extends Publisher<? extends R>> mapper)` | 将每个元素映射到一个Publisher，并按顺序合并所有Publisher的结果。 |
| `concatMap(Function<? super T, ? extends Publisher<? extends R>> mapper)` | 将每个元素映射到一个Publisher，并按顺序连接所有Publisher的结果。 |
| `combineLatest(Publisher<? extends T2> other, BiFunction<? super T, ? super T2, ? extends R> combinator)` | 将当前Publisher和另一个Publisher的最新元素组合成一个新的Publisher。 |
| `subscribe(Consumer<? super T> consumer)` | 订阅当前Publisher并处理发射的元素。 |
| `onErrorReturn(Function<? super Throwable, ? extends T> fallback)` | 在发生错误时返回一个备用值。 |
| `switchOnError(Function<? super Throwable, ? extends Publisher<? extends T>> fallback)` | 在发生错误时切换到另一个Publisher。 |
| `onErrorResumeWith(Function<? super Throwable, ? extends Publisher<? extends T>> fallback)` | 在发生错误时切换到另一个Publisher。 |
| `retry(long maxRetries)` | 在发生错误时重试指定次数。|
