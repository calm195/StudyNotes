# prometheus

Prometheus是一个开源的监控系统和时间序列数据库，主要用于收集和存储指标数据。它提供了强大的查询语言和可视化工具，适用于微服务架构和分布式系统的监控。

## 主要特性

- 通过指标名称和标签划分的多维度、时间序列的数据模型
- 强大的查询语言PromQL，支持复杂的查询和聚合
- 利用HTTP拉取模型收集数据，支持多种数据源
- 可以通过Gateway和Exporter等组件扩展数据收集
- Golang编写，生成的二进制文件易于部署
- 支持服务发现和静态配置
- 支持各种可视化组件

## 核心组件

- **Prometheus Server**：核心组件，负责数据收集、存储和查询。
- **Exporter**：用于从第三方系统（如数据库、消息队列等）收集指标数据的组件。
- **Alertmanager**：用于处理和发送警报通知的组件。
- **Pushgateway**：用于临时性任务的指标推送，适合短生命周期的作业。
- **Client Libraries**：用于在应用程序中集成Prometheus的库，支持多种编程语言。

## 架构图

![Prometheus Architecture](../../image/prometheus-architecture.gif)

### Prometheus Server

Prometheus Server是系统的核心，负责从各个数据源拉取指标数据，并将其存储在时间序列数据库中。它还提供了一个HTTP接口，允许用户通过PromQL查询数据。

配置示例：

```yml
global:
  scrape_interval: 15s 
  evaluation_interval: 15s 
  scrape_timeout: 10s 

rule_files:
  - "rules/*.rules"

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090'] 
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['node-exporter:9100'] 

alerting:
  alertmanagers:
    - static_configs:
        - targets: ['alertmanager:9093']
```

### [TSDB](tsdb.md)(Time-Series Database)

时间序列数据库。时序数据是具有时间戳的数据流，属于某个度量指标(metric)和该指标下的标签(label)的组合。

每条数据的结构如下：

```json
{
    "metric name": "http_requests_total",
    "labels": {
        "method": "GET",
        "status": "200"
    },
    "timestamp": 1633072800, // 时间戳，单位为毫秒
    "value": 1024  // float64类型
}
```

### [PromQL](promql.md)

PromQL是Prometheus的查询语言，用于查询和聚合时间序列数据。它支持多种操作，如过滤、聚合、计算等。
