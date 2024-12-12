# io

go语言中的io包提供了io操作的接口。

## 读接口

- `Reader`：读取数据的接口。
  - `Read(p []byte) (n int, err error)`：读取数据到p中，返回读取的字节数和错误信息。
- `func ReadAll(r Reader) ([]byte, error)`：读取r中的所有数据到[]byte中。

## 写接口

- `Writer`：写入数据的接口。
  - `Write(p []byte) (n int, err error)`：将p写入到Writer中，返回写入的字节数和错误信息。
- `func WriteString(w Writer, s string) (n int, err error)`：将s写入到Writer中，返回写入的字节数和错误信息。

## 复制

- `func Copy(dst Writer, src Reader) (written int64, err error)`：将src中的数据复制到dst中，返回复制的字节数和错误信息。
