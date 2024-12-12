# testing

官方推荐将测试目录与源代码目录放在同一级目录下，测试文件的命名规则为`*_test.go`，目录名为`test`

## test

在test目录下，运行命令`go test`，该包下所有的测试文件都会被执行。

- `go test`
  - `-v`：显示详细信息
  - `-run func_name`：指定要运行的测试函数
  - `-cover`：显示测试覆盖率

## Helper

测试中，部分重复的逻辑会抽离出来，形成一个公共的函数，这些函数在被调用出错时，显示的堆栈信息往往是公共函数的信息，这对于测试而言没有任何好处，使用go提供的帮助函数，在出错时会显示调用者的信息。

只需要在函数中加一句`t.Helper()`，这让报错更加准确，有助于定位错误。

```go
func helper(t *testing.T) {
    t.Helper()
}
```

## hooker

在同一个测试文件中，倘若需要做一些初始化工作和一些完成后的工作，可以将这部分工作抽离出来写在`setup()`和`teardown()`函数中。

```go
func setup() {
   fmt.Println("setup")
}

func teardown() {
   fmt.Println("down")
}

func TestMain(m *testing.M) {
   setup()
   code := m.Run()
   teardown()
   os.Exit(code)
}
```

当`TestMain`函数存在时，启动测试会直接调用`TestMain()`，调用`m.Run()`将会运行所有的测试用例，返回值是未通过的测试用例的个数。

## benchmark test

在测试文件中，使用`Benchmark`前缀的函数，可以进行性能测试。其中，函数名必须以`Benchmark`开头，参数为`*testing.B`。

- 命令参数
  - `-bench`：运行性能测试
  - `-benchmem`：显示内存分配情况
  - `-benchtime`：设置测试时间，默认1s
- 测试函数
  - `Run()`：会运行所有测试
  - `RunParallel()`：可以测试并发性能
