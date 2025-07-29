# systemd

## journalctl

用于查询systemd 日志。

- `-u`：指定服务名，查询该服务的日志。
- `-x`：显示日志的详细信息。
- `-n num`：显示最近的 `num` 条日志。默认是 10 条。
- `-f`：实时跟踪日志输出。
- `--since` 和 `--until`：指定时间范围。
