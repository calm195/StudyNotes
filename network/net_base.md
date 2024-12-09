# Net base

## HTTP

1. Header
    - Host：指定服务器的域名和端口号
    - Referer：指定请求的来源
    - User-Agent：指定客户端的类型，操作系统和浏览器的名称和版本，内核等
    - Content-Type：指定请求体的类型，表示后面的文档属于什么MIME类型
        > 常见的MIME类型：
        > - text/html ：HTML格式
        > - text/plain ：纯文本格式
        > - text/xml ：XML格式
        > - image/gif ：gif图片格式
        > - image/jpeg ：jpg图片格式
        > - image/png：png图片格式
        > - application/xhtml+xml ：XHTML格式
        > - application/xml：XML数据格式
        > - application/atom+xml ：Atom XML聚合格式
        > - application/json：JSON数据格式
        > - application/pdf：pdf格式
        > - application/msword ： Word文档格式
        > - application/octet-stream ： 二进制流数据（如常见的文件下载）
        > - application/x-www-form-urlencoded ：表单数据，编码为key-value格式
        > - multipart/form-data ：表单数据，二进制格式，用于文件上传
    - Cookie：保存在客户端的数据，记录与服务器相关的信息，如sessionID
2. Request
