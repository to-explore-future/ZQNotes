//
//  ViewController.m
//  customview
//
//  Created by sharingmobile on 2018/4/22.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "CustomeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CustomeView *customView = [[CustomeView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [self.view addSubview:customView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
