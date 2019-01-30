    Title: Spring Framework
    Date: 2018-09-01T00:00:00
    Tags: Web, Spring 


[TOC]

 

# Spring

> Spring 参考文档
>
> Spring core
>
> https://docs.spring.io/spring/docs/5.0.5.RELEASE/spring-framework-reference/core.html
>
> Spring mvc
>
>

 

Sping将程序看成由各个组件相互组装而成，`抽象出组件和组装组件的容器`。应用程序中通过组件的配置信息（xml、java注解、java代码）告诉容器如何初始化、配置和组件组件，Spring扫描配置信息，然后按照配置信息组装出程序。这就是Spring的核心原理。

![1523797001169](C:\Users\Gnaily\AppData\Local\Temp\1523797001169.png)

### 应用程序组件的表示——Spring Bean

Spring使用Bean来表示应用程序组件，在Spring中每一个应用程序组件都是一个Bean实体。Spring的Bean可以是任何形式的POJO。

Bean的作用域：

| Scope                                                        | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [singleton](https://docs.spring.io/spring/docs/5.0.5.RELEASE/spring-framework-reference/core.html#beans-factory-scopes-singleton) | (Default) Scopes a single bean definition to a single object instance per Spring IoC container. |
| [prototype](https://docs.spring.io/spring/docs/5.0.5.RELEASE/spring-framework-reference/core.html#beans-factory-scopes-prototype) | Scopes a single bean definition to any number of object instances. |
| [request](https://docs.spring.io/spring/docs/5.0.5.RELEASE/spring-framework-reference/core.html#beans-factory-scopes-request) | Scopes a single bean definition to the lifecycle of a single HTTP request; that is, each HTTP request has its own instance of a bean created off the back of a single bean definition. Only valid in the context of a web-aware Spring `ApplicationContext`. |
| [session](https://docs.spring.io/spring/docs/5.0.5.RELEASE/spring-framework-reference/core.html#beans-factory-scopes-session) | Scopes a single bean definition to the lifecycle of an HTTP `Session`. Only valid in the context of a web-aware Spring `ApplicationContext`. |
| [application](https://docs.spring.io/spring/docs/5.0.5.RELEASE/spring-framework-reference/core.html#beans-factory-scopes-application) | Scopes a single bean definition to the lifecycle of a `ServletContext`. Only valid in the context of a web-aware Spring `ApplicationContext`. |
| [websocket](https://docs.spring.io/spring/docs/5.0.5.RELEASE/spring-framework-reference/web.html#websocket-stomp-websocket-scope) | Scopes a single bean definition to the lifecycle of a `WebSocket`. Only valid in the context of a web-aware Spring `ApplicationContext`. |

Bean的配置：

xml配置Bean：在xml文件中配置一个Bean时，用一个唯一的id来标识这个Bean,用class指定该Bean的类的全限定名（包名.类名）。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd">
 
    <bean id="..." class="...">
        <!-- collaborators and configuration for this bean go here -->
    </bean>
 
    <bean id="..." class="...">
        <!-- collaborators and configuration for this bean go here -->
 
    <!-- more bean definitions go here -->
 
</beans>
```

注解配置Bean：在POJO的类上添加@Bean注解。

 

### 应用程序组件的组装——Spring 依赖注入与控制反转

#### 依赖注入（Dependency Injection）

一个对象不在自己的内部构造出它所依赖的对象，它所依赖的对象由第三方构造然后通过该对象的`构造方法`或者`setter方法`注入进来。

#### 控制反转容器（IoC Container）

Spring通过一个容器来根据一个对象的配置信息（xml、java注解、java代码）组装所依赖的Bean实例，并将组装出的Bean实例注入到该对象中。Spring中的这个容器控制着所有应用组件（Bean对象）的整个生命周期，从如何产生到如何销毁，而原本这些对象的生命周期都是由其依赖的对象直接控制的，这个容器被叫做控制反转容器，因为它反转了对象的控制权。Spring容器是Spring的核心。

 

- `org.springframework.beans`


-   `org.springframework.context`

 

 

### 应用程序资源——Spring Resource

Spring内部自定义的资源：

- UrlResource：wraps a `java.net.URL`, and may be used to access any object that is normally accessible via a URL, such as files, an HTTP target, an FTP target, etc.


- ClassPathResource：represents a resource which should be obtained from the classpath.This uses either the thread context class loader, a given class loader, or a given class for loading resources.
- FileSystemResource：a `Resource` implementation for `java.io.File` handles. It obviously supports resolution as a `File`, and as a `URL`.
- ServletContextResource：a `Resource` implementation for `ServletContext` resources, interpreting relative paths within the relevant web application’s root directory
- InputStreamResource：implementation for a given `InputStream`. This should only be used if no specific `Resource` implementation is applicable.
- ByteArrayResource：a `Resource` implementation for a given byte array

 

 

资源加载器（ResourceLoader）：

资源加载器用来实现在应用程序中加载资源。 Spring中ResourceLoader接口定义如下所示。 Spring中所用的应用程序上下文都实现了该接口。所以如果在应用程序中想要获取资源，可以通过应用程序上下文来获取。例如applicationContext.getResource("http://myhost.com/resource/path/myTemplate.txt")；

```java
public interface ResourceLoader {
 
    Resource getResource(String location);
}
```

 

### 应用程序数据处理——验证、数据绑定和类型转换

#### Validation

 

#### Data Binding

 

#### Type Convertion

Spring 提供了一个通用的类型转换系统,可以用来进行类型之间的转换。其接口定义如下：

```java
package org.springframework.core.convert.converter;
 
public interface Converter<S, T> {
 
    T convert(S source);
 
}
```

 

 

### 切面编程——Spring AOP

#### AOP原理

 

 

#### Spring AOP中的概念

AOP框架是Spring的一个关键组件。AOP的应用如权限管理、日志记录、事务的。Spring中AOP的概念：

- *Aspect* ：切面，对跨越多个类的关注点的模块化抽象。


- *Join point* ：接入点，表示程序执行期间的一个位置，比如程序中某个方法调用前的地方，方法调用异常的地方或者方法调用结束的地方，这些位置可以接入一些切面的行为。
- *Advice* ：表示切面在特殊接入点（join point）的行为。
- *Pointcut* ：切点，对接入点（join point）的匹配预测。Advice 被关联到一个pointcut表达式，它会在匹配 pointcut表达式的任何接入点处执行行。
- *Introduction* ：在一个类型上声明附加的方法和字段
- *Target object* :  目标对象。
- *AOP proxy* ：AOP 框架为实现切面契约而创建的对象，它是Target object的代理对象。
- *Weaving* ：

 

JDk动态代理实现AOP：

```java
public abstract class Aspect implements InvocationHandler {
 
    private Object target;
 
    public Aspect(Object target) {
        this.target = target;
    }
 
    /**
     * Returns target object.
     */
    public final Object getTarget() {
        return this.target;
    }
 
    /**
     * Runs before targets method. Returns {@code true} if target method
     * should run.
     */
    public abstract boolean before(Object target, Method method, Object[] args);
 
    /**
     * Runs after targets method. Returns {@code true} if aspect method should
     * return value, otherwise {@code null}.
     */
    public abstract boolean after(Object target, Method method, Object[] args);
 
    /**
     * Invoked after exception.
     */
    public abstract boolean afterException(Object target, Method method, Object[] args, Throwable throwable);
 
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Object result = null;
 
        if (before(target, method, args)) {
            try {
                result = method.invoke(target, args);
            }
            catch (InvocationTargetException e) {
                afterException(args, method, args, e.getTargetException());
            }
            catch (Exception ex) {
                throw ex;
            }
        }
        if (after(target, method, args)) {
            return result;
        }
        return null;
    }
 
}
```

```java
public class AopProxy {
 
    /**
     * Creates a proxy of given target and the aspect.
     */
    @SuppressWarnings("unchecked")
    public static <T> T proxyOf(T target, Class<? extends Aspect> aspectClass) {
        final Aspect aspect;
 
        try {
            aspect = ClassUtil.newInstance(aspectClass, target);
        }
        catch (Exception e) {
            throw new IllegalArgumentException("Can't create new instance of aspect class", e);
        }
 
        return (T) newProxyInstance(target.getClass().getClassLoader(), aspect, target.getClass().getInterfaces());
    }
 
    /**
     * Creates a proxy from given {@link Aspect}.
     */
    @SuppressWarnings("unchecked")
    public static <T> T proxyOf(Aspect aspect) {
        final Object target = aspect.getTarget();
        return (T) newProxyInstance(target.getClass().getClassLoader(), aspect, target.getClass().getInterfaces());
    }
 
    /**
     * Simple wrapper for javas {@code newProxyInstance}.
     */
    @SuppressWarnings("unchecked")
    public static <T> T newProxyInstance(ClassLoader classloader, InvocationHandler invocationHandler, Class<?>... interfaces) {
        if (interfaces.length == 0) {
            throw new IllegalArgumentException("No interfaces of target class found.");
        }
        return (T) Proxy.newProxyInstance(classloader, interfaces, invocationHandler);
    }
 
}
 
```

 

### Spring事务

 

### SpringMVC