## runtime

分类 --> **load()** 会比main()还要早执行

hook --> 什么时间下钩子, 

@selector 关键字
一个类指针 怎么调用方法  怎么发消息

``` 
NSString * aa = [NSString stringWithFormat:@"abc"];
相当于 NSString这个类指针 底层调用 objc_msgSend(NSString.class,@selector(stringWithFormat));
[aa characterAtIndex:3];
相当于 aa 这个对象指针 调用底层的 objc_msgSend(NSString.class,@selector(characterAtIndex:));
注意:以上只是说明 方法调用的原理,可能类方法的调用 和 对象方法的调用是有区别的 
当一个类指针或者一个对象指针 调用方法的时候 底层调用的是 objc_msgSend() ,然后通过 @selector 去筛选方法名称,每个一个方法名称也是一个指针 ,指向着 方法代码的指针,
```



pc -> program counter pc 寄存器
即将执行的指令,


