# C++

1. 包含头文件，以及函数声明

   ```cpp
   #include <unistd.h>

   extern ssize_t write (int __fd, const void *__buf, size_t __n);
   extern ssize_t read (int __fd, void *__buf, size_t __nbytes);
   ```

2. 读取文件 read

   ```cpp
   /**
    * 从 __fd 中读取 __nbytes 字节到 __buf 中
    * 返回值：实际读取的字节数，失败返回 -1
    */
   extern ssize_t read (int __fd, void *__buf, size_t __nbytes);

   int fd = open("file.txt", O_RDONLY); // 只读模式
   char buf[1024];
   int n = read(fd, buf, 1024);
   ```

3. 写入文件 write

   ```cpp
   /**
    * 将 __buf 中的 __n 字节写入 __fd
    * 返回值：实际写入的字节数，失败返回 -1
    */
   extern ssize_t write (int __fd, const void *__buf, size_t __n);

   int fd = open("file.txt", O_WRONLY); // 只写模式；O_RDWR 读写模式；
   char buf[1024] = "Hello, world!";
   int n = write(fd, buf, 1024);
   ```

4. 打开文件 open

   ```cpp
   #include <fcntl.h>
   int open(const char *pathname, int flags, mode_t mode);

   int fd = open("example.txt", O_RDWR | O_CREAT | O_APPEND,
                               S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);

   ```

   - `pathname`：文件路径
   - `flags`：文件打开方式
     - `O_RDONLY`：只读
     - `O_WRONLY`：只写
     - `O_RDWR`：读写
     - `O_CREAT`：文件不存在则创建
     - `O_TRUNC`：文件存在则清空
     - `O_APPEND`：追加
   - `mode`：文件权限
     - `S_IRUSR`：用户读
     - `S_IWUSR`：用户写
     - `S_IXUSR`：用户执行
     - `S_IRGRP`：组读
     - `S_IWGRP`：组写
     - `S_IXGRP`：组执行
     - `S_IROTH`：其他读
     - `S_IWOTH`：其他写
     - `S_IXOTH`：其他执行
