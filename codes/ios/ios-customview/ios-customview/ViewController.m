//
//  ViewController.m
//  ios-customview
//
//  Created by sharingmobile on 2018/4/26.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "ZQCustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width =[UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    ZQCustomView * view = [[ZQCustomView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
