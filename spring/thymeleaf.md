# Thymeleaf

## Thymeleaf简介

[Thymeleaf](https://www.thymeleaf.org/index.html)是一个用于Web和独立环境的现代服务器端Java模板引擎，能够处理HTML、XML、JavaScript、CSS甚至纯文本。Thymeleaf的主要目标是提供一种优雅和高度可维护的创建模板的方式。它在Web环境中是一个很好的选择，因为它可以处理HTML5，甚至可以在不同的浏览器中正确显示。

## 配置文件

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

```properties
# Thymeleaf
spring:
    thymeleaf:
        prefix: classpath:/templates/
        suffix: .html
        mode: HTML
        encoding: UTF-8
        cache: false
```

## Model

- `Model`是一个接口，它是一个容器，可以将数据存储，视图默认调用。
  - `addAttribute(String attributeName, Object attributeValue)`：将属性添加到模型中。
  - `addObject(Object attributeValue)`：将属性添加到模型中。
  - `setViewName(String viewName)`：设置视图名称。
- `ModelAndView`是一个类，它包含了模型和视图的信息。后端可以直接返回`ModelAndView`对象。
  - `ModelAndView(String viewName)`：构造方法，设置视图名称。
  - `addObject(Object attributeValue)`：将属性添加到模型中。
- `HttpServletRequest`是一个接口，它提供了请求信息的方法。
  - `getParameter(String name)`：获取请求参数。
  - `setAttribute(String name, Object value)`：设置请求属性。

## Thymeleaf语法

需要在HTML文件中引入命名空间。

```html
<html xmlns:th="http://www.thymeleaf.org">
```

### 常用标签

用于替换HTML标签属性的默认值

- `th:text`：文本内容。
- `th:utext`：文本内容（不转义）。
- `th:if`：条件判断。
  - `th:else`：条件判断。
- `th:unless`：条件判断。
- `th:each`：遍历集合。用于循环。
  - `th:each="item : ${items}"`：遍历集合。
- `th:object`：对象属性。给列表链接对象
- `th:switch`：多条件判断。
  - `th:case`：多条件判断。
- `th:href`：超链接。
- `th:src`：图片链接。

### 表达式

- `${}`：变量表达式。内部可以是对象、属性，对象可以调用相关方法。
- `@{}`：URL表达式。引入资源文件。
- `*{}`：选择表达式。用于对象属性。选定上一层的对象，直接访问属性。
- `#{}`：国际化表达式。可以用于读取配置文件内的信息
