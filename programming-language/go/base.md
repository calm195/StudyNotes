# go基础

## 数据类型

- 基本数据类型
  - 整型：int、int8、int16、int32(rune)、int64、uint、uint8(byte)、uint16、uint32、uint64、uintptr。
  - 浮点型：float32、float64。
  - 复数：complex64、complex128。
  - 布尔型：bool。
  - 字符串：string。
  - 字符：byte、rune。
- 复合数据类型
  - 数组：[n]T。
  - 切片：[]T。
  - 字典：map[K]V。
  - 结构体：struct。
  - 接口：interface。
  - 通道：chan。
- 其他数据类型
  - 指针：*T。
  - 函数：func。
- 零值
  - 数值类型：0。
  - 布尔类型：false。
  - 字符串类型：""。
  - 指针类型：nil。
  - 切片、字典、通道、函数：nil。
  - 接口：nil。
- 常量
  - `const`关键字定义常量。
    - 可以不指定类型，由编译器自动推断。
    - 必须指定初始值。
    - 不可以使用`:=`。
    - 可以用()批量定义。
      - `const (a = 1 b = 2 c = 3)`。
  - `iota`：常量计数器，只能在常量表达式中使用。
    - 原理：每遇到一个`const`关键字，`iota`会重置为0，每遇到一个`iota`，`iota`会自增1。

## 语法特点

- Go语言中，每个语句后面都不需要加分号。
- 没有自增和自减运算符。++、--被降级为语句，只能后置，且不再具有返回值。
- if、for、switch、select等关键字后面的条件语句不需要加括号。
  - for循环中，初始化语句和后置语句是可选的。当同时省略时，相当于while。可以省略分号。
    - 无限循环：`for {}`。
    - `for range`：遍历数组、切片、字典、通道等。返回两个值，第一个是索引，第二个是对应元素的值。
      - `for i, v := range arr {}`。
      - `for _, v := range arr {}`。
      - `for i := range arr {}`。
  - if语句中，可以在条件语句前加一个简单的语句，用于初始化变量。
    - `if a := 1; a > 0 {}`。
    - 该变量在`else`中也可以使用。
  - switch语句中，可以在条件语句前加一个简单的语句，用于初始化变量。
    - `switch a := 1; a {case 1:}`。
    - 每个case后面不需要加break，Go会自动break。
    - case无需为常量，可以是任意表达式。
    - 条件值也可以为常量。
    - 无条件switch：`switch {}`。
      - 相当于`switch true {}`。可以替代if-else。
- `select`：管道多路复用的控制结构。
  - 用于处理异步IO操作。
  - `select`中的每个case必须是一个通道操作，且必须是一种操作，要么读要么写。
  - `select`会阻塞，直到某个case可以执行。
  - 如果有多个case可以执行，Go会随机选择一个执行。
  - `select`可以用于超时控制。
    - `select {case <-ch: case <-time.After(1 * time.Second):}`。
  - 永久阻塞：`select {}`。
  - 永不执行：case中的通道是nil。
- 数字无法代替bool值，必须使用`true`或`false`。
- 类型在变量名后面。
- 当两个以上的连续的函数命名参数是同一类型时，除最后一个类型外，其他的都可以省略。
- 函数可以返回多个值，返回值在函数名后面，用逗号分隔且用括号包裹。
- `var`关键字用于声明变量，
- `:=`用于声明并初始化变量，如果提供了初始值，Go会自动推断变量类型。可以省略`var`关键字。只能在函数内部使用。
- 类型转换：`T(v)`，将v转换为T类型。需要显式指定。
  - 当一个变量为指针类型时，其调用成员时可以省略`*`，go会自动解引用。
- 方法
  - Go语言中没有类，但可以给任意类型添加方法。方法是一种特殊的函数，它在函数名前面加一个接收者。接收者可以是值类型或指针类型。
  - 写法：`func (r ReceiverType) funcName(parameters) (results)`。
  - 接收者可以是值类型或指针类型。
    - 值类型：`func (r ReceiverType) funcName(parameters) (results)`。
    - 指针类型：`func (r *ReceiverType) funcName(parameters) (results)`。
  - 一旦定义了方法，那么该类型的变量都可以调用此方法。
  - 只能给自己包内的类型定义方法。
- 接口
  - 接口是一种抽象类型，只定义方法，不实现。接口中的方法都是抽象方法。
  - 接口定义：`type interfaceName interface {method1() returnType1 method2() returnType2 ...}`。
  - 实现接口：`type structName struct {}`，`func (s structName) method1() returnType1 {return}`。
    - 只需要将具体实现类型赋值给接口类型变量即可实现。
  - 空接口：`interface{}`，可以接收任意类型。
    - 用于存储任意类型的值。因为空接口没有定义任何方法，所以任何类型都实现了空接口。
- 类型断言
  - 语法：`value, ok := x.(T)`。
    - x：接口类型变量。
    - T：断言的类型。
    - value：转换后的值。
    - ok：是否转换成功。
- 类型选择
  - 语法：`switch v := x.(type) {case T1: case T2:}`。
    - x：接口类型变量。
    - v：转换后的值。
    - T1、T2：断言的类型。
- 类型参数
  - 语法：`func funcName[T any](parameters) (results)`。
    - T：类型参数。
    - any：任意类型。
    - T类型满足any类型的约束。如`comparable`
    - 当any为`any`时，表示任意类型，即泛型。
- 数组初始化时使用的长度必须是常量。
  - `var arr [5]int`：声明一个长度为5的int数组。不指定初始值，将声明一个切片。
  - `arr := [5]int{1, 2, 3, 4, 5}`：声明并初始化一个长度为5的int数组。
  - `arr := [...]int{1, 2, 3, 4, 5}`：声明并初始化一个长度为5的int数组，Go会自动计算长度。
  - `arr := [5]int{1: 1, 3: 3}`：声明并初始化一个长度不定的int数组，索引1和3的值为1和3。
  - `len := 5`，`var nums [len]int`：错误
- 数组与切片共有长度和容量两个属性。
  - 长度：`len(arr)`。实际能访问的元素个数。
  - 容量：`cap(arr)`。实际内存中的元素个数。切片的容量会自动扩张。
- 切片语法
  - `arr[low:high]`：截取数组或切片，包含low，不包含high。
  - `arr[low:high:max]`：截取数组或切片，容量为max-low。
- 不支持函数重载
- 结构体匿名组合可以直接访问匿名结构体的字段。
- 结构体标签
  - 用于给字段添加元信息。
  - 通过反射机制获取。
  - 一般用于序列化和反序列化。
  
  > ```go
  > type User struct {
  >     Name string `json:"name"`
  >     Age int `json:"age"`
  > }
  > ```

## 关键字

- `defer`：延迟执行，函数结束时执行。多个`defer`按照先进后出的顺序执行。
- `go`：开启一个新的goroutine。协程。
- `chan`：信道。用于goroutine之间的通信。
  - `make(chan T)`：创建一个类型为T的信道。
  - `make(chan T, size)`：创建一个缓冲大小为size的类型为T的信道。
  - `close(ch)`：关闭信道。一般不需要关闭，除非是循环读取数据时需要停止等情况。
  - `<-chan`：只读信道。
  - `chan<-`：只写信道。
- `<-`：信道操作符，用于发送和接收数据。
  - `ch <- v`：发送v到信道ch。
  - `v := <-ch`：从ch接收数据并赋值给v。
- `fallthrough`：继续执行下一个case。
- `goto`：跳转到指定标签。
  - label：标签。

  > ```go
  > label:
  >     // code
  > goto label
  > ```

- `new()`：分配内存，返回指针。

## 环境变量

- `GOROOT`：Go的安装目录。当执行golang程序时，编译器会先在`GOROOT`下查找标准库，然后再在`GOPATH/src`下查找自定义库。
- `GOPATH`：Go的工作目录。在工程经过`go build`、`go install`、`go get`等命令后，会在`GOPATH`下生成`bin`、`pkg`、`src`三个目录。`bin`目录存放可执行文件，`pkg`目录存放编译后的包文件，`src`目录存放源码文件。
- `GOMOD`：将第三方的库放在`/pkg/mod`目录下，而不是放在`GOPATH`下。
  - `go env -w GO111MODULE=on`：开启`GOMOD`。
    > on：开启`GOMOD`。
    > off：关闭`GOMOD`，会将第三方库放在`GOPATH/src`下。
    > auto：自动判断是否开启`GOMOD`，如果当前目录下有`go.mod`文件，则开启`GOMOD`，否则关闭`GOMOD`。

## 常用命令

- `go run`：编译并运行Go程序。会产生一个临时的可执行文件，运行结束后会自动删除。
- `go build`：编译Go程序。如果程序中有`main`函数，会生成一个可执行文件；如果没有`main`函数，会生成一个包文件。
- `go install`：编译导入的包文件，并将可执行文件放到`GOPATH/bin`目录下，包文件放到`GOPATH/pkg`目录下。
- `go get`：下载并安装包文件。会将包文件放到`GOPATH/src`目录下。
- `gofmt`：格式化Go代码。
- `go mod`：管理依赖包。
  - `go mod init`：初始化`go.mod`文件。
  - `go mod tidy`：清理理依赖包。
  - `go mod download`：下载依赖包。
  - `go mod edit`：编辑`go.mod`文件。
  - `go mod graph`：打印模块依赖图。
  - `go mod verify`：验证依赖包。
  - `go mod why`：解释项目什么地方用到了依赖包。

## 访问控制

- Go语言中，只有首字母大写的变量、常量、函数、结构体、接口等才能被其他包访问，首字母小写的只能在本包中访问。
