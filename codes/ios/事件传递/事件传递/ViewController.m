//
//  ViewController.m
//  事件传递
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "FView.h"
#import "SView.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"ViewController 响应");
    [super touchesBegan:touches withEvent:event];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    FView* fView = [[FView alloc] init];
    fView.frame = CGRectMake(50, 50, 270, 600);
    fView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:fView];
    
    SView * sView = [[SView alloc ] init];
    sView.frame = CGRectMake(100, 100, 120, 400);
    sView.backgroundColor = [UIColor orangeColor];
    [fView addSubview:sView];
    
    self.view.backgroundColor = [UIColor purpleColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
