//
//  ViewController.m
//  CALayterTest
//
//  Created by sharingmobile on 2018/4/8.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//



#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kScreen_width   [[UIScreen mainScreen] bounds].size.width
#define kScreen_height  [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    // Do any additional setup after loading the view, typically from a nib.
    UIView * layerView = [[UIView alloc] initWithFrame:CGRectMake(kScreen_width / 2 - 100, kScreen_height / 2 - 100, 200, 200)];
    [layerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:layerView];
    
    CALayer * bluelayer = [CALayer layer];
    [bluelayer setFrame:CGRectMake(kScreen_width / 2 - 50, kScreen_height / 2 - 50, 100, 100)];
    [bluelayer setBackgroundColor:[UIColor blueColor].CGColor];
    [self.view.layer addSublayer:bluelayer];
    
    //测试 retain
    id obj = [[NSObject alloc] init];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
