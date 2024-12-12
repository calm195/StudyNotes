# context

## interface

```go
type Context interface {
    // Done returns a channel that's closed when work done on behalf of this
    // context should be canceled.
    Done() <-chan struct{}

    // Err indicates why this context was canceled, after the Done channel
    // is closed.
    Err() error

    // Deadline returns the time when this Context will be canceled, if any.
    Deadline() (deadline time.Time, ok bool)

    // Value returns the value associated with key or nil if none.
    Value(key interface{}) interface{}
}
```

```go
type Canceler interface {
    // Done returns a channel that's closed when work done on behalf of this
    // context should be canceled.
    Done() <-chan struct{}

    // Err indicates why this context was canceled, after the Done channel
    // is closed.
    Err() error
}
```

## 实现

- `emptyCtx`：空的Context，不包含任何值，内部类型为int。提供两个实例方法，通常作为父context
  - `Background()`：返回一个空的Context。
  - `TODO()`：返回一个空的Context。
- `valueCtx`：包含一个父Context和一个值，内部类型为any键值对，只实现了`Value`方法。
  - `WithValue(parent Context, key, val interface{})`：返回一个包含键值对的Context。
- `cancelCtx`：包含一个父Context和一个取消函数。
  - 实现了`Canceler`接口。
  - `WithCancel(parent Context)`：返回一个包含取消函数的Context。
- `timerCtx`：包含一个父Context、一个取消函数和一个定时器。
  - 实现了`Canceler`接口。
  - 在`cancelCtx`的基础上增加了定时器。
  - `WithDeadline(parent Context, deadline time.Time)`：返回一个包含定时器的Context。
  - `WithTimeout(parent Context, timeout time.Duration)`：返回一个包含超时时间的Context。
