//
//  ViewController.m
//  ios-NSOpration
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
    UIButton *btn   = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag         = 102;
    btn.frame       = CGRectMake(0, 100, 320, 30);
    
    [btn setTitle:@"线程一" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn1  = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag        = 103;
    btn1.frame      = CGRectMake(0, 200, 320, 30);
    
    [btn1 setTitle:@"线程二" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn];
    
    //这仅仅是一个队列 ，但是里面没有任务
    _queue = [[NSOperationQueue alloc] init];
    [_queue setMaxConcurrentOperationCount:5];
}

- (void) pressBtn:(UIButton*) btn{
    if (btn.tag == 102) {
        //1.
        //使用这种方式添加一个任务
        NSInvocationOperation   *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperation) object:nil];
        //把任务添加到队列中
        [_queue addOperation:invocationOperation];
        NSLog(@"invocationOperation add success...");
        
        
        //2.
        //NSInvocationOperation 里面有一个invocation 上面是直接初始化
        //也可以先初始化 invocation
//        NSInvocation    *invocation = [[NSInvocation alloc] init];
//        invocation.target           = self;
//        invocation.selector         = @selector(aaa);
//        NSInvocationOperation   *invocationOperation2 = [[NSInvocationOperation alloc]initWithInvocation:invocation];
//        [_queue addOperation:invocationOperation2];
//        NSLog(@"invocaitonOperation2 add success...");
        
    }else{
        //3.
        //使用代码块
        // '^' 表示代码块
        [_queue addOperationWithBlock:^{
//            while (YES) {
                NSLog(@"block is an operation");
//            }
        }];
        NSLog(@"block add success...");
    }
}

- (void) invocationOperation{
    NSLog(@"invocationOperation invoke success...");
}

- (void) aaa{
    NSLog(@"invocation invoke success...");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
