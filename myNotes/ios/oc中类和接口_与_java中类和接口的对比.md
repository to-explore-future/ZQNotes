## oc中类和接口 与 Java中类和接口的对比
### java
接口：interface 修饰，定义一些抽象的方法
类：class 修饰 ，定义成员变量，成员方法(全都有方法体)

### oc 中
`protocol`:在oc中这个叫做协议，其实就是Java中的接口，定义一些不实现的方法。

`interface`:

这个要和 `implementation`一块说:我们在定义一个类的时候，xcode会自动生成两个文件（`.h` `.m`）,

`.h`文件中有`@interface` `.m`文件中有`@implementation`.

人们习惯 将成员变量和一些方法（未实现）定义在 @interface中，然后再到@implementation中实现未实现的方法（`多此一举`）

然后oc这一派的人们吧 习惯把@interface叫做接口，习惯把@implementation叫做类。其实在java这一派的人来看，oc这一派人所认为的 @interface 和 @implementation 的两个文件合起来 才是java中的类。

所以游走于两种语言之间的人 容易迷糊

最后总结：

java中的类 	<==> 	oc中的[`@interface + @implementation`] 或者 [`.h + .m`]
 
java中的接口	<==>	oc中的 `protocol[协议，代理]`
