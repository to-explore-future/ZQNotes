//
//  ViewController.m
//  iso-多线程
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
    btn.tag = 102;
    btn.frame  = CGRectMake(0, 100, 320, 30);
    
    [btn setTitle:@"线程一" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag = 103;
    btn1.frame  = CGRectMake(0, 200, 320, 30);
    
    [btn1 setTitle:@"线程二" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn];
    
    _lock = [[NSLock alloc] init];
    
}

- (void) pressBtn:(UIButton*) btn{
    if (btn.tag == 102) {
        _t1 = [[NSThread alloc]initWithTarget:self selector:@selector(t1) object:nil];
        [_t1 start];
    }else{
        _t2 = [[NSThread alloc] initWithTarget:self selector:@selector(t2) object:nil];
        [_t2 start];
    }
}

- (void) t1{
    for (int i = 0; i <= 10000; i ++) {
        NSLog(@"thread1---count = %d",_count);
        [_lock lock];
        _count++;
        [_lock unlock];
    }
}

- (void) t2{
    for (int j = 0; j <= 10000; j ++) {
        NSLog(@"thread2 = %d",_count);
        [_lock lock];
        _count++;
        [_lock unlock];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
