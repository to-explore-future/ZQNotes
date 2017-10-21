//
//  ViewController.m
//  UISwitch控件
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//同步属相和成员变量
@synthesize mySwitch = _mySwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mySwitch = [[UISwitch alloc] init];
    //这个Switch 的其实位置(x,y)是可以改变的，但是宽高是不可以改变的开始给值 也是没有用 这个控件的源码 已经把宽高写死了，
    _mySwitch.frame = CGRectMake(100,100, 80, 40);
    _mySwitch.on = NO;//开启状态
    // [_mySwitch setOn:YES];
//    [_mySwitch setOn:YES animated:NO];
    [self.view addSubview:_mySwitch];
    
    //设置 开启状态时 的颜色
    [_mySwitch setOnTintColor:[UIColor orangeColor]];
    
    //改变 开关按钮() 的颜色 进度条中的按钮 也是用的 thumb 这个词
    [_mySwitch setThumbTintColor:[UIColor greenColor]];
    
    //设置整体 外围的 颜色
    [_mySwitch setTintColor:[UIColor purpleColor]];
    
    //响应事件
    [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged]    ;
    
}

- (void) swChange:(UISwitch *)sw{
    if(sw.on == YES){
       NSLog(@"开关 on");
    }else{
       NSLog(@"开关 off");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




















@end
