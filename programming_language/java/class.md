# Class类

Class类是Java中所有类的根类，提供了关于类的元数据和操作类的功能。它是Java反射机制的核心部分。

## 获取Class对象

获取Class对象的方式有多种，常用的包括：

1. 使用类名.class

   ```java
   Class<?> clazz = String.class;
   ```

2. 使用Class.forName()方法

   ```java
    Class<?> clazz = Class.forName("java.lang.String");
    ```

3. 使用对象的getClass()方法

    ```java
    String str = "Hello";
    Class<?> clazz = str.getClass();
    ```

4. 使用类加载器的loadClass()方法

    ```java
    ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    Class<?> clazz = classLoader.loadClass("java.lang.String");
    ```

## Class类的常用方法

| 方法名 | 说明 |
|:-----|:----|
| `String getName()` | 获取类的全限定名 |
| `String getSimpleName()` | 获取类的简单名 |
| `URL getResource(String path)` | 获取类路径下的资源，当`path`以`/`开头时，从`classpath`查找，否则从类所在包查找 |
| `InputStream getResourceAsStream(String path)` | 如果`path`是工程文件，那么返回`java.io.BufferedInputStream`。如果是Jar包中的文件，那么返回`sun.net.www.protocol.jar.JarURLConnection$JarURLInputStream` |
