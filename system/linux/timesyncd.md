# timesyncd 时间同步

timesyncd 是 systemd 的一部分，用于在 Linux 系统上进行时间同步。它可以通过网络协议（如 NTP）来同步系统时间。

**断点式更新**：timesyncd 只会在系统时间偏差超过一定阈值时才进行更新。同老旧的`ntpdate`不同，timesyncd 不会频繁地查询时间服务器，而是根据系统时间的变化来决定是否需要同步。

> 不能与`ntpd`同时使用。

使用NTP服务前需要确保系统已安装 `systemd-timesyncd`。

```bash
sudo apt update
sudo apt install systemd-timesyncd
```

## 简单流程

1. 检查当前时间同步状态

    ```bash
    timedatectl status
    ```

2. 修改NTP时间同步服务器

    ```bash
    sudo vim /etc/systemd/timesyncd.conf
    ```

    在 `[Time]` 部分添加或修改以下行：

    ```ini
    NTP=cn.pool.ntp.org
    FallbackNTP=ntp.sjtu.edu.cn
    RootDistanceMaxSec=5
    PollIntervalMaxSec=2048
    PollIntervalMinSec=32
    ```

3. 启用NTP服务

    ```bash
    sudo timedatectl set-ntp on
    ```

4. 设置时区

    ```bash
    timedatectl list-timezones # 列出所有时区
    sudo timedatectl set-timezone Asia/Shanghai
    ```
