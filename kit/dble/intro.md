# DBLE

[DBLE](https://github.com/actiontech/dble)是上海爱可生信息技术股份有限公司基于MySQL的高可扩展性的分布式中间件，存在以下几个优势特性：

1. **数据水平拆分** 随着业务的发展，您可以使用dble来替换原始的单个MySQL实例。
2. **兼容MySQL** 与MySQL协议兼容，在大多数情况下，您可以用它替换MySQL来为你的应用程序提供新的存储，而无需更改任何代码。
3. **高可用性** dble服务器可以用作集群，业务不会受到单节点故障的影响。
4. **SQL支持** 支持SQL 92标准和MySQL方言。我们支持复杂的SQL查询，如group by，order by，distinct，join，union，sub-query等等。
5. **复杂查询优化** 优化复杂查询，包括但不限于全局表连接分片表，ER关系表，子查询，简化选择项等。
6. **分布式事务支持** 使用两阶段提交的分布式事务。您可以为了性能选择普通模式或者为了数据安全采用XA模式。当然，XA模式依赖于MySQL-5.7的XA Transaction，MySQL节点的高可用性和数据的可靠性。
