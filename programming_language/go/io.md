# io

go语言中的io包提供了io操作的接口。

## 读接口

- `Reader`：读取数据的接口。
  - `Read(p []byte) (n int, err error)`：读取数据到p中，返回读取的字节数和错误信息。
