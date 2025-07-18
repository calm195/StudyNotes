# Ribbon

Ribbon是一种微服务负载均衡器，提供了多种负载均衡策略和路由功能。它可以帮助开发者在微服务架构中实现高效的请求分发和流量管理。

目前负载均衡方案主要有：

- 集中式：在消费者和提供者之间引入一个负载均衡器，所有请求都通过这个负载均衡器进行转发。
  - 例如：Nginx、HAProxy等。
- 分布式：每个消费者自己维护一个负载均衡器，直接与提供者通信。
  - 例如：Ribbon、Spring Cloud LoadBalancer等。

**常见负载均衡策略：**

- 随机：随机选择一个可用的服务实例进行请求转发。
- 轮询：按照顺序依次选择每个可用的服务实例进行请求转发。
- 最少连接：选择当前连接数最少的服务实例进行请求转发。
- 加权轮训：根据服务实例的权重进行轮询，权重高的实例被选中的概率更大。
- 地址哈希：根据请求的地址进行哈希计算，选择对应的服务实例。

## Ribbon的负载均衡策略

- `RandomRule`：随机选择一个服务实例。
- `RoundRobinRule`：轮询选择服务实例。
- `RetryRule`：轮训，在一定时间内重试失败的服务实例。
- `WeightedResponseTimeRule`：根据响应时间加权选择服务实例。
- `ClientConfigEnabledRoundRobinRule`：客户端配置启用的轮询规则。
- `BestAvailableRule`：选择当前可用的服务实例。
- `ZoneAvoidanceRule`：复合判断server所在区域的性能和可用性
- `AvailabilityFilteringRule`：过滤掉不可用的服务实例，选择并发较的实例
