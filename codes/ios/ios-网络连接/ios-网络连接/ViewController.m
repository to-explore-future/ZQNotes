//
//  ViewController.m
//  ios-网络连接
//
//  Created by to-explore-future on 17/10/27.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame  = CGRectMake(0, 100, 320, 30);
    [btn setTitle:@"使用NSURLConnection连接网络" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame  = CGRectMake(0, 200, 320, 30);
    [btn1 setTitle:@"使用NSURLSession连接网络" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(session) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn1];
    [self.view addSubview:btn];
}


- (void)session{
    
}

- (void) press{
    NSLog(@"开始连接网络");
    //需要网址
    NSString        *strUrl     = @"http://www.baidu.com";
    
    //把字符串的网址转换成 URL格式
    NSURL           *url        = [NSURL URLWithString:strUrl];
    
    //请求信息不只是网址，还有一些别的请求信息：请求头...
    //所有的请求信息都在 这个请求对象中
    NSURLRequest    *request    = [NSURLRequest requestWithURL:url];
    
    //创建一个请求信息的请求对象
    _connect = [NSURLConnection connectionWithRequest:request delegate:self];
    /*
     这个时候 已经开始请求了
     */
    
}
/*
 NSURLConnection：拿到了Viewcontroller的对象，NSURLConnection在请求网络的过程中
 要回调 viewController中的 实现的 NSURLConnectionDataDelegate,NSURLConnectionDelegate
 里面的方法， 重写这些方法
 */

//错误时
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"error = %@",error);
}

//接到 响应码
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *res = (NSHTTPURLResponse*) response;
    if (res.statusCode == 200) {
        NSLog(@"连接成功");
    }else if(res.statusCode == 404){
       NSLog(@"没找到");
    }else if(res.statusCode == 500){
        NSLog(@"服务器端错误");
    }
  
}

//回传数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //数据可能是分批次 互传回来的，每次都把数据存放到一个 可变容量的容器中
    [_data appendData:data];
}

//结束 回传数据
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
   //数据传输完毕之后 把容器中的数据 取出来
    NSString * str = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@"message = %@",str);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
