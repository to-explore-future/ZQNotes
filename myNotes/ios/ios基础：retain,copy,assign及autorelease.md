## IOS基础：retain,copy,assign及autorelease

#### 一,retain, copy, assign区别

1. 假设你用malloc分配了一块内存，并且把它的地址赋值给了指针a，后来你希望指针b也共享这块内存，于是你又把a赋值给（assign）了b。此时a 和b指向同一块内存，请问当a不再需要这块内存，能否直接释放它？答案是否定的，因为a并不知道b是否还在使用这块内存，如果a释放了，那么b在使用这块内存的时候会引起程序crash掉。

2. 了解到1中assign的问题，那么如何解决？最简单的一个方法就是使用引用计数（reference counting），还是上面的那个例子，我们给那块内存设一个引用计数，当内存被分配并且赋值给a时，引用计数是1。当把a赋值给b时引用计数增加到 2。这时如果a不再使用这块内存，它只需要把引用计数减1，表明自己不再拥有这块内存。b不再使用这块内存时也把引用计数减1。当引用计数变为0的时候，代表该内存不再被任何指针所引用，系统可以把它直接释放掉。

3. 上面两点其实就是`assign和retain的区别`，`assign`就是直接赋值(并没有计数)，从而可能引起1中的问题，当数据为int, float等原生类型时，可以使用assign。`所有才有assign修饰基本数据类型`。retain就如2中所述，使用了引用计数，retain引起引用计数加1, release引起引用计数减1，当引用计数为0时，dealloc函数被调用，内存被回收。`所有才有tetain修饰除了基本数据类型和数组之外的数据类型`。
 
4. `copy`是在你不希望a和b共享一块内存时会使用到。a和b各自有自己的内存。

5. atomic和nonatomic用来决定编译器生成的getter和setter是否为原子操作。在多线程环境下，原子操作是必要的，否则有可能引起错误的结果。加了atomic，setter函数会变成下面这样：

	```
	if (property != newValue) {   
    	[property release];   
    	property = [newValue retain];   
	}
	```

#### 二,深入理解一下(包括autorelease)

1. retain之后count加一。alloc之后count就是1，release就会调用dealloc销毁这个对象。
如果 retain，需要release两次。通常在method中把参数赋给成员变量时需要retain。
例如：
ClassA有 setName这个方法：

	```
	-(void)setName:(ClassName *) inputName
	{
   		name = inputName;
   		[name retain]; //此处retian，等同于[inputName retain],count等于2
	}
	
	```
	调用时：

	```
	ClassName *myName = [[ClassName alloc] init];
	[classA setName:myName]; //retain count == 2
	[myName release]; //retain count==1，在ClassA的dealloc中release name才能	真正释放内存。
	
	```

2. autorelease 更加tricky，而且很容易被它的名字迷惑。我在这里要强调一下：autorelease不是garbage collection，完全不同于Java或者.Net中的GC。
autorelease和作用域没有任何关系！

	autorelease 原理：

	```
a.先建立一个autorelease pool
b.对象从这个autorelease pool里面生成。
c.对象生成 之后调用autorelease函数，这个函数的作用仅仅是在autorelease pool中做个标记，让pool记得将来release一下这个对象。
d.程序结束时，pool本身也需要rerlease, 此时pool会把每一个标记为autorelease的对象release一次。如果某个对象此时retain count大于1，这个对象还是没有被销毁。

```
上面这个例子应该这样写：

	```
ClassName *myName = [[[ClassName alloc] init] autorelease];//标记为autorelease
[classA setName:myName]; //retain count == 2
[myName release]; //retain count==1，注意，在ClassA的dealloc中不能release name，否则release pool时会release这个retain count为0的对象，这是不对的。

```

	`记住一点`：如果这个对象是你alloc或者new出来的，你就需要调用release。如果使用autorelease，那么仅在发生过retain的时候release一次（让retain count始终为1）。