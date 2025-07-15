# 数据结构

## 基本数据结构

| 数据结构 | 说明 | 实现方式 |
|:-------|:----| :--- |
| String | 一种二进制安全的数据类型，可以用来存储任何类型的数据，比如字符串、整数、图片、序列化后的对象等。 | SDS（Simple Dynamic String） |
| List | 双向链表，支持反向查找和遍历，方便操作但是有额外的内存开销 | Linked List / ZipList / QuickList / ListPack |
| Set | 无序集合，内部元素唯一，没有先后顺序 | Dict / IntSet |
| ZSet | 有序集合，相比无序集合增加了一个权重参数score，可以通过score进行排序和查找 | ZipList / Skiplist |
| Hash | 哈希表， String类型的映射表，特别适合存储对象，可以直接修改对象里的值 | Dict / ZipList |

## 特殊数据结构

| 数据结构 | 说明 | 实现方式 |
|:-------|:----| :--- |
| Bitmap | 位图，可以用来存储用户签到、用户在线状态等信息 | String |
| HyperLogLog | 基数统计 | Bitmap |
| Geo | 地理位置 | ZSet |
| Stream | 消息队列 | List |

## 内置数据结构

1. SDS：简单动态字符串，是Redis的字符串实现，比C语言的字符串更加安全和高效。

    > ```c
    > struct sdshdr {
    >     int len; // 字符串长度
    >     int free; // 空闲空间长度
    >     char buf[]; // 字符串数据
    > };
    >```

2. Linked List：双向链表，是Redis的列表实现，支持快速插入和删除。

    > ```c
    > struct listNode {
    >     struct listNode *prev; // 前一个节点
    >     struct listNode *next; // 后一个节点
    >     void *value; // 节点数据
    > };
    > ```

    > ```c
    > struct list {
    >     listNode *head; // 头节点
    >     listNode *tail; // 尾节点
    >     unsigned long len; // 节点数量
    >     void *dup(void* ); // 复制函数
    >     void *free(void* ); // 释放函数
    >     void *match(void* , void*); // 比较函数
    > };
    > ```

    - 缺点
      - 额外的内存开销
      - 随机访问性能差
      - CPU缓存不友好

3. ZipList：压缩列表，是Redis的列表和有序集合实现，节省内存。

    > ```c
    > struct ziplist {
    >     unsigned int zlbytes; // 压缩列表占用的内存字节数 4字节
    >     unsigned int zltail; // 尾节点距离起始位置的偏移字节数 4字节
    >     unsigned short zllen; // 节点数量 2字节
    >     unsigned char zlend; // 结尾标识 1字节
    >     entry[] // 节点数据 长度由具体数据决定
    > };
    > ```

    - entry内部结构
      - previous_entry_length // 前一个节点的长度 1字节或5字节
      - encoding // 编码方式 1字节或2字节或5字节
      - content // 节点数据 长度由具体数据决定 可以是字节数组或整数
    - 优点
      - 紧凑的数据结构，节省内存
      - 顺序访问性能好
      - 减少内存碎片
    - 缺点
      - 插入和删除操作性能差
      - 需要重新分配内存
    - 适用场景
      - 数据量较小
      - 读多写少
    - 连续更新
        插入一个大于等于254字节的节点，并且后续存在多个连续的、长度在250-253之间的节点，那么后续节点为了保存上一个节点的长度，prev_entry_length字段会从1字节变为5字节，这样会导致后续节点的长度增加4个字节。于是出现连续更新风暴。

4. QuickList：快速列表，是Redis的列表实现，支持快速插入和删除。

    > ```c
    > struct quicklist {
    >     quicklistNode *head; // 头节点
    >     quicklistNode *tail; // 尾节点
    >     unsigned long count; // 节点数量
    >     unsigned int len; // 总长度
    >     int fill; // 压缩列表节点最大长度
    > };
    > ```

    quicklistNode内部结构

    > ```c
    > struct quicklistNode {
    >     struct quicklistNode *prev; // 前一个节点
    >     struct quicklistNode *next; // 后一个节点
    >     unsigned char *zl; // 压缩列表
    >     unsigned int sz; // 节点长度
    >     unsigned int count; // 节点数量
    > };
    > ```

    - 在向quicklist插入数据时，会先检查插入位置的压缩列表节点是否有足够的空间，如果没有则新建一个节点。
    - 这样的设计并没有完全解决压缩列表的连续更新问题，因为连续更新问题根源在于压缩列表的结构设计，但是通过限制压缩列表节点的最大长度和个数，可以减少连续更新的风险。

5. ListPack：列表包，是Redis的列表实现，支持快速插入和删除。

    > ```c
    > struct listpack {
    >     unsigned int total_bytes; // 整个结构的长度
    >     unsigned short size; // entry长度，固定两个字节 
    >     char end; // 结尾标识 永远为0xFF，一个字节
    >     entrys; // 数据
    > };
    > ```

    entry内部结构

    > ```c
    > struct entry {
    >     unsigned char encoding; // 编码方式
    >     unsigned char length; // encoding+content的长度
    >     char content[]; // 数据
    > };
    > ```

    - 根据entry的length属性可以从后向前遍历。

6. Dict：字典，是Redis的哈希表实现，支持快速查找。

    > ```c
    > struct dict {
    >     dictType *type; // 类型
    >     void *privdata; // 私有数据
    >     dictht ht[2]; // 哈希表
    >     int rehashidx; // 重哈希索引
    >     unsigned long iterators; // 迭代器数量
    > };
    > ```

    - ht[0]：当前哈希表，ht[1]：下一个哈希表。两个哈希表交替使用。

    dictht内部结构

    > ```c
    > struct dictht {
    >     dictEntry **table; // 哈希表数组
    >     unsigned long size; // 哈希表大小
    >     unsigned long sizemask; // 哈希表掩码，用于计算索引
    >     unsigned long used; // 哈希表已使用节点数量
    > };
    > ```

    dictEntry内部结构

    > ```c
    > struct dictEntry {
    >     void *key; // 键
    >     union {
    >         void *val; // 值
    >         uint64_t u64;
    >         int64_t s64;
    >         double d;
    >     } v;
    >     struct dictEntry *next; // 下一个节点
    > };
    > ```

    dictType内部结构

    > ```c
    > struct dictType {
    >     uint64_t (*hashFunction)(const void *key); // 哈希函数
    >     void *(*keyDup)(void *privdata, const void *key); // 复制键
    >     void *(*valDup)(void *privdata, const void *obj); // 复制值
    >     int (*keyCompare)(void *privdata, const void *key1, const void *key2); // 比较键
    >    void (*keyDestructor)(void *privdata, void *key); // 销毁键
    >     void (*valDestructor)(void *privdata, void *obj); // 销毁值
    > };
    > ```

    - rehash
      - 发生条件
        - 负载因子 = 已使用节点数量 / 哈希表大小
        - 当哈希表的负载因子大于等于1时，并且Redis没有在执行bgsave、bgrewriteaof等操作，即没有执行RDB快照或者没有进行AOF重写时，Redis会自动开始rehash操作。
        - 当哈希表的负载因子大于等于5时，Redis会强制开始rehash操作。
      - 拷贝式rehash
        - 一次性将ht[0]的所有节点拷贝到ht[1]，然后释放ht[0]。
        - 优点：操作简单，不会出现哈希冲突。
        - 缺点：可能会发生阻塞，影响redis服务。
      - 渐进式rehash
        - 给ht[1]分配空间
        - 每次哈希表增删改查时，同时将相应的节点从ht[0]移动到ht[1]。
        - 随着时间推移，rehash操作会逐渐完成。
        - 优点：不会阻塞redis服务。

7. IntSet：整数集合，是Redis的集合实现，节省内存。

    > ```c
    > struct intset {
    >     uint32_t encoding; // 编码方式
    >     uint32_t length; // 集合长度
    >     int8_t contents[]; // 数据
    > };
    > ```

    - contents声明为int8_t类型数组，但实际上存储的是不同长度的整数。而类型根据encoding字段的值来确定。
    - 三种编码方式
      - INTSET_ENC_INT16
      - INTSET_ENC_INT32
      - INTSET_ENC_INT64
    - 升级
      - 当插入一个大于当前编码的整数时，会将整数集合升级为更高的编码方式。
      - 首先进行数组扩容，然后将所有整数转换为新的编码方式。
      - 升级后不支持降级。

8. Skiplist：跳跃表，是Redis的有序集合实现，支持快速查找。

    > ```c
    > struct zskiplist {
    >     struct zskiplistNode *header; // 头节点
    >     struct zskiplistNode *tail; // 尾节点
    >     unsigned long length; // 节点数量
    >     int level; // 最大层数
    > };
    > ```

    zskiplistNode内部结构

    > ```c
    > struct zskiplistNode {
    >     double score; // 分值
    >     sds ele; // 元素
    >     struct zskiplistNode *backward; // 后退指针
    >     struct zskiplistLevel {
    >         struct zskiplistNode *forward; // 前进指针
    >         unsigned int span; // 跨度
    >     } level[];
    > };
    > ```
