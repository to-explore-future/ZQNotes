//
//  ViewController.m
//  NSUserDefaults
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn1 = [[UIButton alloc] init];
    [btn1 setTitle:@"写入数据" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(100, 100, 200, 100);
//    btn1.tintColor = [UIColor orangeColor];
    [btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(inputData) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn2 = [[UIButton alloc] init];
    [btn2 setTitle:@"读取数据" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(100, 300, 200, 100);
//    btn1.tintColor = [UIColor orangeColor];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(getData) forControlEvents:UIControlEventTouchUpInside];
    
    

    [self.view addSubview:btn2];
    [self.view addSubview:btn1];
    
}

- (void) inputData{
    NSUserDefaults * uf = [NSUserDefaults standardUserDefaults];
    
    BOOL aaa = YES;
    [uf setBool:aaa forKey:@"bool"];
    
    NSInteger ger = 100;
    [uf setInteger:ger forKey:@"integer"];
    
    
    
}

- (void) getData{
    NSUserDefaults * uf = [NSUserDefaults standardUserDefaults];
    
    NSInteger ger = [uf integerForKey:@"integer"];
    NSLog(@"integer = %li",ger);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
