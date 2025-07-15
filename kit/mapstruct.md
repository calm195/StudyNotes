# mapstruct

MapStruct 是一个代码生成器，用于简化 Java Bean 之间的映射。它通过注解处理器在编译时生成映射代码，避免了手动编写转换逻辑的繁琐。

## maven 依赖

```xml
<properties>
    <org.mapstruct.version>1.6.3</org.mapstruct.version>
</properties>

<dependencies>
    <dependency>
        <groupId>org.mapstruct</groupId>
        <artifactId>mapstruct</artifactId>
        <version>${org.mapstruct.version}</version>
    </dependency>
</dependencies>

<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.1</version>
            <configuration>
                <source>1.8</source>
                <target>1.8</target>
                <annotationProcessorPaths>
                    <path>
                        <groupId>org.mapstruct</groupId>
                        <artifactId>mapstruct-processor</artifactId>
                        <version>${org.mapstruct.version}</version>
                    </path>
                </annotationProcessorPaths>
            </configuration>
        </plugin>
    </plugins>
</build>
```

## 使用示例

```java
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserMapper {
    UserMapper INSTANCE = Mappers.getMapper(UserMapper.class);

    @Mapping(source = "name", target = "fullName")
    UserDTO userToUserDTO(User user);

    @Mapping(source = "fullName", target = "name")
    @Mapping(source = "age", target = "yearsOld")
    User userDTOToUser(UserDTO userDTO);
}
```

## 常用注解

- `@Mapper`：标记接口为 MapStruct 映射器，MapStruct 会为其生成实现类。
- `@Mapping`：定义源属性和目标属性之间的映射关系，可以指定源属性和目标属性的名称。来源可以是多个实体类的属性。
- `@Mappings`：用于批量定义多个映射关系。
- `@InheritConfiguration`：定义在基类或者是接口，实现或者继承基类或接口时，继承映射方法的配置。
- `@InheritInverseConfiguration`：反转映射关系的配置，可以用于简化双向映射的实现。
