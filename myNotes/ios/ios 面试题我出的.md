## ios 面试题

1.下面的代码的运行结果,解释运行过程

```
	int local = 100;
    void (^myBlock)(void) = ^{
        NSLog(@"global = %d",local);
    };
    local = 200;
    myBlock();

```

2. 有以下组件,请拼接成完整的NSURL  

	Componnent | Value 
	---------  | ---------
	scheme | https 
	user | root
	password | 12345
	host | www.toExploreFuture.com
	port | 8080
	path | /script.ext
	pathExtension | ext
	pathComponents | ["/","script.ext"]
	parameterString | param=value
	query | query=value
	fragment | ref
	
3.如果服务器上的图片访问都需要账号密码,如何配置**SDWebImage**.  
4.从内存的角度,说说**UIImage**加载图片的方式. 
5.服务器返回什么格式数据,如何解析的?
	mj_extension 遇到集合model怎么写.
	
6.AFNetWorking 怎么配置,各种配置参数.  
7.A --> B --> C , 怎样让 C 直接回到 A .



###  如何考察
1.英语 --> 苹果官方英文文档,阅读,解释,不看文档只会道听途说.   
2.看过源码真的看过吗,比如 "看过AFNetWorking源码,那就从socket说起,人家是怎么做这个,如果只是知道 有几个类,那跟没看过 有什么区别"    
3.遇到过什么困难,为什么我没有记录,看看别人记录过吗   
4.区别

``` 
[view clipToBounds];
view.layer.maskToBounds = YES;

clipsToBounds：是指视图上的子视图,如果超出父视图的部分就截取掉,
masksToBounds：是指视图的图层上的子图层,如果超出父图层的部分就截取掉

```
