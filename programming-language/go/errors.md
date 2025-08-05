# errors

## 创建

- `errors.New("error message")` 创建一个新的错误
- `fmt.Errorf("error message")` 创建一个新的错误

## 判断

- `errors.Is(err, target)` 判断错误是否是目标错误

## 解包

- `errors.Unwrap(err)` 解包错误
- `errors.As(err, target)` 寻找第一个匹配的目标错误

## panic

- `panic(err)` 抛出错误
- `recover()` 捕获处理错误
  - 必须在`defer`中使用
  - 不能闭包中使用
  - `panic`参数不为`nil`

examples:

```go
package main

import (
    "errors"
    "fmt"
)

func main() {
    defer func() {
        if err := recover(); err != nil {
            fmt.Println(err)
        }
    }()

    panic(errors.New("error message"))
}
```

## fatal
