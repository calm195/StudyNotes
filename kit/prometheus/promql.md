# PromQL

PromQL（Prometheus Query Language）是Prometheus的查询语言，用于查询和操作存储在Prometheus中的时间序列数据。它提供了强大的功能来进行数据聚合、过滤和计算。

## 基本语法

PromQL的基本语法由以下几个部分组成：

- **Metric**：指标名称，表示要查询的时间序列数据。
- **Label**：标签，用于过滤和聚合数据。标签由键值对组成，表示指标的维度和属性。
- **Operator**：操作符，用于执行计算和比较操作。
- **Function**：函数，用于对数据进行处理和转换。
- **Range Vector**：时间范围向量，用于指定查询的时间范围。
- **Instant Vector**：瞬时向量，表示某一时刻的时间序列数据。

## 语法规则

1. **即时向量查询**：直接查询指标名称。
    > 例如：`http_requests_total`表示查询所有的HTTP请求总数。
    > 可以使用标签过滤，如`http_requests_total{method="GET", status="200"}`表示查询GET方法且状态码为200的HTTP请求总数。
2. **范围向量查询**：使用方括号指定时间范围，如`metric_name[5m]`表示过去5分钟的数据。
   > 在一个向量表达式后面加上方括号，可以获取该指标在指定时间范围内的值。
   > 常用的时间范围单位有：
   - `s`：秒
   - `m`：分钟
   - `h`：小时
   - `d`：天
   - `w`：周
   - `y`：年
3. **偏移量查询**：使用`offset`关键字指定时间偏移量，如`metric_name[5m] offset 1h`表示查询1小时前的过去5分钟数据。
   > 注意：偏移量只能用于范围向量查询。
4. **聚合函数**：使用聚合函数对数据进行汇总，如`sum()`, `avg()`, `max()`, `min()`等。
    > 例如：`sum(http_requests_total)`表示查询所有HTTP请求总数的总和。
    > 常见的聚合函数包括：
   - `sum()`：求和
   - `avg()`：平均值
   - `max()`：最大值
   - `min()`：最小值
   - `count()`：计数
   - `topk(<k>)`：获取前k个值

## 查询示例

以下是一些常见的PromQL查询示例：

```promql
# 查询所有http_requests_total指标
http_requests_total
# 查询特定标签的指标
http_requests_total{method="GET", status="200"}
# 查询过去5分钟内的平均请求速率
rate(http_requests_total[5m])
# 查询过去1小时内的最大内存使用量
max_over_time(memory_usage[1h])
# 查询过去10分钟内的错误率
sum(rate(http_errors_total[10m])) / sum(rate(http_requests_total[10m]))
# 查询过去1天内的CPU使用率
avg(cpu_usage[1d])
# 查询过去30分钟内的请求延迟的95百分位数
histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[30m])) by (le))
```
