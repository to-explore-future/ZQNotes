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
5.

