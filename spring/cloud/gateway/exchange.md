# Exchange

## ServerWebExchange

`ServerWebExchange` 是 Spring Cloud Gateway 中的核心接口。它提了对HTTP request和response的访问，并且提供了对这两者的修改能力。

常见方法包括：

| 方法 | 描述 |
| ---- | ---- |
| `ServerHttpRequest getRequest()` | 获取当前的HTTP请求。 |
| `ServerHttpResponse getResponse()` | 获取当前的HTTP响应。 |
| `Map<String, Object> getAttributes()` | 获取当前exchange的属性。 |
| `Mono<WebSession> getSession()` | 获取当前的会话信息。 |
| `T getAttribute(String name)` | 获取指定名称的属性。 |
| `ApplicationContext getApplicationContext()` | 获取当前的应用上下文。 |
| `String transformUrl(String url)` | 转换URL。 |
| `void addUrlTransformer(Function<String, String> transformer)` | URL转换映射 |
| `ServerWebExchange mutate()` | 创建一个新的`ServerWebExchange`实例，并可以对新实例进行修改。 |

## ServerWebExchangeUtils

`ServerWebExchangeUtils`提供了许多静态公有的字符串Key值

常见的Key值包括：

| Key | 描述 |
| --- | ---- |
| `PRESERVE_HOST_HEADER` | 保护原始主机头信息。 |
| `CLIENT_RESPONSE_ATTR` | 客户端响应属性。 |
| `CLIENT_RESPONSE_CONN_ATTR` | 客户端响应连接属性。 |
| `GATEWAY_REQUEST_URL_ATTR` | 请求到下游服务的真实URI。 |
| `GATEWAY_ORIGINAL_REQUEST_URL_ATTR` | 原始请求的URL。 |
| `GATEWAY_ALREADY_ROUTED_ATTR` | 标记请求是否已经被路由。 |
| `GATEWAY_ALREADY_PREFIXED_ATTR` | 标记请求是否已经被前缀化。 |
