//
//  ViewController.m
//  IOS中叫做代理Java中叫做接口
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "Second.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"第一个页面";
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Second * se = [[Second alloc] init];
    se.delegete = self;
    [self.navigationController pushViewController:se animated:YES];
    NSLog(@"%@",self.navigationController);
    NSLog(@"坎坎坷坷扩扩扩");
}

- (void)changeColor:(UIColor *)color{
    self.view.backgroundColor = color;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
