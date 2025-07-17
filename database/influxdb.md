# influxDB

由 [InfluxDB](https://www.influxdata.com/products/influxdb/)使用Go语言编写的开源时序数据库，着力于高性能查询与存储时序型数据。

三大特性：

1. **时间序列**：时间相关的函数
2. **度量**：可以实时对大量数据计算
3. **事件**：支持任意的事件数据

相关名词：

- **database**：数据库，InfluxDB中的数据存储单元
- **Measurement**：度量，类似于关系型数据库中的表
- **Tag**：标签，用于对数据进行分类
- **Field**：字段，存储实际的数据值
- **timestamp**：时间戳，记录数据的时间点
- **Point**：数据点，包含时间戳、标签和字段
    > Point是InfluxDB中存储数据的基本单位，每个Point包含一个时间戳、多个标签和多个字段。
    > - **timestamp**：数据点的时间戳，自动生成的主索引
    > - **tags**：数据点的标签，用于对数据进行分类和查询
    > - **fields**：数据点的字段，存储实际的数据值
- **series**：系列，包含相同Measurement和标签的所有数据点
