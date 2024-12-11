# strings

go语言中的strings包提供了对字符串的操作。

## 字符串操作

- `Contains(s, substr string) bool`：判断字符串s中是否包含substr。
- `Count(s, sep string) int`：计算字符串s中sep的个数。
- `HasPrefix(s, prefix string) bool`：判断字符串s是否以prefix开头。
- `HasSuffix(s, suffix string) bool`：判断字符串s是否以suffix结尾。
- `Index(s, sep string) int`：返回sep在s中第一次出现的位置，不存在则返回-1。
- `Join(a []string, sep string) string`：连接字符串a，用sep分隔。
- `Repeat(s string, count int) string`：重复s count次。
- `Replace(s, old, new string, n int) string`：替换s中的old为new，n为替换次数，-1表示全部替换。
- `Split(s, sep string) []string`：分割s，用sep分隔。
- `ToLower(s string) string`：转换s为小写。
- `ToUpper(s string) string`：转换s为大写。
- `Trim(s string, cutset string) string`：去掉s中cutset开头和结尾的字符。
- `TrimLeft(s string, cutset string) string`：去掉s中cutset开头的字符。
- `TrimRight(s string, cutset string) string`：去掉s中cutset结尾的字符。
- `TrimSpace(s string) string`：去掉s中的空白字符。
- `NewReader(s string) *Reader`：返回一个从s读取数据的Reader。
