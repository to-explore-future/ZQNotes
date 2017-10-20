//
//  ViewController.m
//  UIViweController基础
//
//  Created by to-explore-future on 17/10/20.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//但视图控制器第一次被加载 显示视图的时候 调用此函数
//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


//当内存过低的时候 会调用这个方法，
//Android中也有类似的方法 onTrimMemory() onLowMemory()
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"内存过低了");
}


@end
