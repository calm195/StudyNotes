# 计算机网络

> 根据`https://javaguide.cn/`内文章学习

## OSI 七层体系结构

> 国际标准化组织提出的一个网络分层模型，**结构概念清楚，理论完整**，但比较**复杂且不实用**，并且有些功能在多个层次重复出现。

1. **应用层**：为计算机用户提供服务
2. **表示层**：数据处理（编解码、加密解密、压缩解压缩）
3. **会话层**：管理（建立、维护、重连）应用程序之间的会话
4. **传输层**：为两台主机进程之间的通信提供通用的数据传输服务
5. **网络层**：路由和寻址（决定数据在网络的游走路径）
6. **数据链路层**：帧编码和误差纠正控制
7. **物理层**：透明地传送比特流传输

## TCP/IP四层模型

> 目前广泛采用地一种模板

 1. **应用层**：主要提供两个终端设备上的应用程序之间信息交换的服务，定义了信息交换的格式，消息交给下一层来处理。数据格式为**报文**。

    > 常见协议：**HTTP**，**SMTP**，**POP3/IMAP**，**FTP**，**Telnet**，**SSH**，**RTP**，**DNS**

 2. **传输层**：负责向两台终端设备进程之间的通信提供通用的数据传输服务。数据格式为**用户数据报**。

    > 常见协议：**TCP**, **UDP**

 3. **网络层**：负责为分组交换网上的不同主机提供通信服务。数据格式为**IP数据报**。

    > 常见协议：**IP**, **ARP**, **ICMP**, **NAT**, **OSPF**, **RIP**, **BGP**

 4. **网络接口层**：将IP数据报组装成帧，在两个相邻节点间的链路上传送帧，每一帧包括数据和必要的控制信息（如同步信息，地址信息，差错控制等）；实现相邻计算机节点之间比特流的透明传送，尽可能屏蔽具体传输介质和物理设备的差异。

    > 重要功能和协议：**MAC**, **CSMA/CD**, **多路访问**, **以太网**, **差错检测**。

## 应用层常见协议总结

1. HTTP：主要用于Web浏览器和服务器之间的通信。基于TCP协议。

2. Websocket：全双工通信协议。基于TCP协议。

   > 仅需一次握手，便可以创建持久性的连接，进行双向数据传输。

3. 

