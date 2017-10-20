//
//  ViewController.m
//  定时器和视图对象
//
//  Created by to-explore-future on 17/10/20.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize timerView = _timerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * start = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    start.frame = CGRectMake(100, 100, 100, 50);
    [start setTitle:@"开始" forState:UIControlStateNormal];
    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    
    UIButton *stop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stop.frame = CGRectMake(100, 200, 100, 50);
    [stop setTitle:@"停止" forState:UIControlStateNormal];
    [stop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stop];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 50, 50);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    // tag最好设置 100 之后 防止和系统的冲突
    view.tag = 101;
    
}

- (void) start{
    //开启一个定时器
    _timerView = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
}

- (void) stop{
    if(_timerView != nil){
        [_timerView invalidate];
    }
}

- (void )startTimer{
    NSLog(@"warnning!!!");
    UIView * view = [self.view viewWithTag:101];
    view.frame = CGRectMake(view.frame.origin.x+1, view.frame.origin.y+2, 50, 50);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
