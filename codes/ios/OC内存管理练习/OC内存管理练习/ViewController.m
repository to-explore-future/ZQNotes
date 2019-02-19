//
//  ViewController.m
//  OC内存管理练习
//
//  Created by haoqiao on 2019/2/15.
//  Copyright © 2019 zq. All rights reserved.
//

#import "ViewController.h"
#import "WBLibS.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * view = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 40)];
    view.titleLabel.text = @"按钮一";
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 40)];
    btn2.titleLabel.text = @"按钮2";
    btn2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)test:(UIButton*)btn{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"test" object:nil];
}

- (void)test2{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"test2" object:nil];
}


@end
