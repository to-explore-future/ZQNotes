//
//  ViewController.m
//  视图控制器的使用
//
//  Created by to-explore-future on 17/10/20.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

//只会加载一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    ViewController2 * vc2 = [[ViewController2 alloc] init];
    //相当于 startActivity
    [self presentViewController:vc2 animated:YES completion:nil];
}

//当时视图控制器的视图即将显示的时候 调用此函数
//视图分为：1.显示前(不显示) 2.正在显示 3.已经被隐藏
//参数 ：表示是否动画切换
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"View will appear ");
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"View will disappear");
}

//屏幕已经显示到屏幕上的时候调用此函数
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"view did appear on the screen");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"View did disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
