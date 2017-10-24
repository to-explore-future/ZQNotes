//
//  ViewController.m
//  子视图手动布局
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "SuperView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SuperView * sView = [[SuperView alloc] init];
    sView.tag  = 102;
    sView.frame =CGRectMake(50, 50, 100, 300);
    sView.backgroundColor = [UIColor grayColor];
    
    [sView initViews];
    [self.view addSubview:sView];
    
    //添加两个button
    UIButton * btn1 = [[UIButton alloc] init];
    btn1.frame = CGRectMake(270, 500, 40, 20);
    [btn1 setTitle:@"放大" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal  ];
    [btn1 addTarget:self action:@selector(magnify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton * btn2 = [[UIButton alloc] init];
    btn2.frame = CGRectMake(270, 530, 40, 20);
    [btn2 setTitle:@"缩小" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(shrink) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal  ];

    [self.view addSubview:btn2];

    
    
}

//放大superView
- (void) magnify{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    SuperView * sView = [self.view viewWithTag:102];
    sView.frame = CGRectMake(50, 50, 220, 450);
    [UIView commitAnimations];
}

//缩小superView
- (void) shrink{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    SuperView * sView = [self.view viewWithTag:102];
    sView.frame = CGRectMake(50, 50, 100, 300);
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
