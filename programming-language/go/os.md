# os

## 文件描述符

- `Stdin`
- `Stdout`
- `Stderr`

## 打开文件

- `func Open(name string) (file *File, err error)`：打开一个文件，只读模式。
- `func OpenFile(name string, flag int, perm FileMode) (file *File, err error)`：打开一个文件，flag为打开模式，perm为文件权限。
- `func Lstat(name string) (fi FileInfo, err error)`：返回一个文件的信息，如果是符号链接，返回链接信息。

## 读取文件

- `func (f *File) Read(b []byte) (n int, err error)`：读取文件内容到b中，返回读取的字节数和错误信息。
- `func (f *File) ReadAt(b []byte, off int64) (n int, err error)`：从off位置读取文件内容到b中，返回读取的字节数和错误信息。
- `func ReadFile(filename string) ([]byte, error)`：读取文件内容到[]byte中。
- `func ReadDir(dirname string) ([]DirEntry, error)`：读取目录中的文件信息。
- `func (f *File) ReadDir(n int) ([]DirEntry, error)`：读取目录中的文件信息，n为读取的数量。

## 写入文件

- `func (f *File) Write(b []byte) (n int, err error)`：将b写入文件，返回写入的字节数和错误信息。
- `func (f *File) WriteAt(b []byte, off int64) (n int, err error)`：将b写入文件的off位置，返回写入的字节数和错误信息。
- `func (f *File) WriteString(s string) (n int, err error)`：将s写入文件，返回写入的字节数和错误信息。
- `func WriteFile(filename string, data []byte, perm FileMode) error`：将data写入文件，perm为文件权限。

## 创建文件

- `func Create(name string) (file *File, err error)`：创建一个文件。
- `func Mkdir(name string, perm FileMode) error`：创建一个目录。
- `func MkdirAll(path string, perm FileMode) error`：创建一个目录及其父目录。

## 复制文件

- `func (f *File) ReadFrom(r Reader) (n int64, err error)`：从r中读取数据到文件中，返回读取的字节数和错误信息。

## 重命名文件

- `func Rename(oldpath, newpath string) error`：重命名文件。

## 删除文件

- `func Remove(name string) error`：删除单个非空目录或文件。
- `func RemoveAll(path string) error`：删除目录及其子目录。

## 关闭文件

- `func (f *File) Close() error`：关闭文件。
