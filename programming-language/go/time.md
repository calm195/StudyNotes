# time

## 控制

- `func Sleep(d Duration)`：休眠d时间。
- `func After(d Duration) <-chan Time`：返回一个通道，d时间后发送当前时间。
