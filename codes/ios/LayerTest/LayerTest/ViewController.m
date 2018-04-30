//
//  ViewController.m
//  LayerTest
//
//  Created by sharingmobile on 2018/4/27.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "MicroPhoneBottom.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CGRect rect = CGRectMake(150, 400, 200, 200);
    CGRect rect1 = CGRectMake(0, 0, 200, 200);
    MicroPhoneBottom * phoneB = [[MicroPhoneBottom alloc] initWithFrame:rect1];
    
    UIView * view1 = [[UIView alloc] initWithFrame:rect];
//    [view1 setBackgroundColor:[UIColor clearColor]];
    [view1 addSubview:phoneB];
    
    [self.view addSubview:view1];
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(-70, -280, 140, 300)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    view.layer.cornerRadius = 70;
    view.layer.masksToBounds = YES;
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-50, 50, 200, 350) cornerRadius:5];
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor;
    [view.layer addSublayer:layer];
    
    [view1 addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
