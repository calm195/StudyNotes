# sync

go语言中的sync包提供了同步原语的支持。

## 锁

- `Mutex`：互斥锁。
  - `Lock`：加锁。
  - `Unlock`：解锁。
- `RWMutex`：读写锁。
  - `RLock`：加读锁。
  - `RUnlock`：解读锁。
  - `Lock`：加写锁。
  - `Unlock`：解写锁。
  - `TryLock`：尝试加写锁。
  - `TryRLock`：尝试加读锁。
  
## WaitGroup

开箱即用，内部实现是计算器和信号量。

- `func (wg *WaitGroup) Add(delta int)`：增加计数器。
- `func (wg *WaitGroup) Done()`：减少计数器。
- `func (wg *WaitGroup) Wait()`：等待计数器归零。
