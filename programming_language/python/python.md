1. 查看类变量的类名

   ```python{.line-numbers}
   class A:
       pass
   a = A()
   print(a.__class__.__name__)
   print(tpye(a).__name__)
   ```

2. 时间戳

    ```python{.line-numbers}
    import time
    print(time.time())
    print(time.localtime())
    print(time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()))

    # 字符串转换为时间戳
    timeArray = time.strptime("2021-03-19 10:00:00", "%Y-%m-%d %H:%M:%S")
    timeStamp = int(time.mktime(timeArray))
    
    # 时间戳转换为字符串
    timeArray = time.localtime(timeStamp)
    timeStr = time.strftime("%Y-%m-%d %H:%M:%S", timeArray)
    ```
