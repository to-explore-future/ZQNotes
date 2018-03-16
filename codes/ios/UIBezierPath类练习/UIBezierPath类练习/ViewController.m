//
//  ViewController.m
//  UIBezierPath类练习
//
//  Created by sharingmobile on 2018/3/7.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "ViewController.h"
#import "CustomPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CustomPathView * pathView = [[CustomPathView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [pathView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:pathView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
