# Server Http

## ServerHttpRequest

`ServerHttpRequest`代表一个HTTP请求。它提供了访问请求各种属性的方法。是`Spring WebFlux`中实现异步、非阻塞的HTTP请求处理的基础。

关键方法包括：

1. `toBuilder()`：创建一个`ServerHttpRequest.Builder`实例，用于构建新的请求。
2. `getId()`：获取请求的唯一标识符。
3. `getPath()`：获取请求的路径。
4. `getQueryParams()`：获取请求的所有查询参数。
5. `getHeaders()`：获取请求的所有HTTP头信息。
6. `getMethod()`：获取请求的方法（如GET、POST等）。
7. `getCookies()`：获取请求中的所有Cookie。
8. `getRemoteAddress()`：获取请求的远程地址。
9. `getLocalAddress()`：获取请求的本地地址。
10. `getSslInfo()`：获取SSL信息（如果适用）。
11. `mutate()`：创建一个新的`ServerHttpRequest.Builder`实例，可以对新请求进行修改。

## ServerHttpResponse

`ServerHttpResponse`代表一个HTTP响应。它提供了对响应的访问和修改能力。

关键方法包括：

1. `setStatusCode(HttpStatus status)`：设置响应的HTTP状态码。
2. `getStatusCode()`：获取响应的HTTP状态码。
3. `getCookies()`：获取响应中的所有Cookie。
4. `addCookie(Cookie cookie)`：添加一个Cookie到响应中
5. `getHeaders()`：获取响应的所有HTTP头信息。
6. `writeWith(Publisher<? extends DataBuffer> body)`：异步写入响应体。
7. `writeAndFlushWith(Publisher<? extends Publisher<? extends DataBuffer>> body)`：异步写入响应体并刷新缓冲区
8. `setComplete()`：标记响应为已完成。
