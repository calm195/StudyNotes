# curl

1. ipv4与ipv6冲突，导致请求很慢

   > `vim /etc/rosolv.conf`
   >
   > **写入** `options single-request-reopen`
   >
   > 如果重启后失效，原因应该是上述文件被重置了，可以锁定这个文件
   >
   > `chattr +i /etc/resolv.conf`
