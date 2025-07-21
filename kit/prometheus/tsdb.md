# TSDB(Time-Series Database)

时间序列数据库。时序数据是具有时间戳的数据流，属于某个度量指标(metric)和该指标下的标签(label)的组合，称为向量。

每条数据的结构如下：

```json
{
    "metric name": "http_requests_total",
    "labels": {
        "method": "GET",
        "status": "200"
    },
    "timestamp": 1633072800,
    "value": 1024
}
```

## metric

metric由metric name、labels组成，称为一个指标
所有的metric都通过如下格式表示：
`<metric name>{<label1>=<value1>, <label2>=<value2>, ...}`

- metric name是指标的名称，通常是一个动词或名词短语，表示要监控的对象或操作。
  > 名称必须符合正则表达式`[a-zA-Z_:][a-zA-Z0-9_:]*`
- labels是一个键值对集合，用于描述指标的维度和属性。
  > 标签的键必须符合正则表达式`[a-zA-Z_][a-zA-Z0-9_]*`，值可以是任意字符串。

### metrics类型

Prometheus支持多种类型的指标，主要包括：

- **Counter**：计数器，表示单调递增的值，如请求总数、错误总数等。
  - 常用工具有
  - `rate()`：计算单位时间内的平均速率。
  - `topk()`：获取前N个值。
- **Gauge**：仪表盘，表示可以增加或减少的值，如当前内存使用量、当前连接数等。
  - 常用工具有
  - `delta()`：计算两个时间点之间的差值。
  - `predict_linear()`：线性预测未来的值。
- **Histogram**：直方图，用于测量分布，如请求延迟、响应大小等。
- **Summary**：摘要，用于测量分布的统计信息，如请求延迟的百分位数等。
