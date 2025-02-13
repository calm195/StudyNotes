# Markdown

语法速查：[Markdown 语法速查](https://markdown.com.cn/cheat-sheet.html)

## attention

Markdown is a lightweight markup language with plain text formatting syntax. Its design allows it to be converted to many output formats, but the original tool by the same name only supports HTML. Markdown is often used to format readme files, for writing messages in online discussion forums, and to create rich text using a plain text editor.

- 锚点跳转`[name](#target)`
  - `[name](#target)`：`name`为锚点名，`target`为目标名
  - target可以跳到任意一个链接的某个位置，如`[git](../versions/git.md#git-status)`
  - target中不能使用大写字母、空格以及`.`英文句点
  - 如果是中文，默认转化成链接，将会含有大写字母。故报错
    > 可以使用`<a name="target"></a>`来定义中文锚点
