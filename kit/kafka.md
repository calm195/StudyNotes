# Kafka

Kafka是一个分布式的发布/订阅消息系统，旨在处理大量实时数据流。它具有高吞吐量、可扩展性和持久性，广泛应用于数据管道、流处理和事件驱动架构。

## 术语

- **Broker**: Kafka集群中的服务器节点，负责存储和转发消息。
- **Topic**: 消息的分类，Kafka中的消息被组织成主题。
- **Partition**: 每个主题可以分为多个分区，分区是消息的有序集合，允许并行处理。
- **Replication**: 分区的副本，每个分区可以有多个副本，分布在不同的broker上，以提高容错性。
- **Message**: Kafka中的数据单元，包含键、值和时间戳。

## Kafka工作流程

1. 生产者向Kafka集群发送消息，指定主题和分区
   > 选择分区：指定、轮训、哈希等方式。
   > 确认成功：发送给Leader即成功、Ack后成功、全局Ack后成功
   1. 生产者查询Leader Broker，查找消息对应的partition的Leader。
   2. 生产者将消息发送到Leader Broker。
   3. Leader Broker将消息写入log
   4. Leader通知Follower Broker同步消息。
   5. Follower Broker从Leader Broker拉取消息并存储Replication，完成后向Leader Broker发送确认。
   6. Leader Broker等待所有Follower Broker确认后，向生产者发送ACK。
2. Broker接收消息并将其存储在相应的分区中。
3. 消费者订阅主题，从Broker中读取消息进行处理。
