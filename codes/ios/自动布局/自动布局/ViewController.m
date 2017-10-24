//
//  ViewController.m
//  自动布局
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView * BV = [[UIView alloc]init];
    BV.tag = 101;
    BV.frame = CGRectMake(20, 20, 250, 500);
    BV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:BV];
    
    UILabel * L1 = [[UILabel alloc] init];
    UILabel * L2 = [[UILabel alloc] init];
    UILabel * L3 = [[UILabel alloc] init];
    UILabel * L4 = [[UILabel alloc] init];
    
    L1.frame = CGRectMake(0, 0, 40, 40);
    L2.frame = CGRectMake(250 - 40 , 0, 40, 40);
    L3.frame = CGRectMake(250 - 40 , 500 - 40, 40, 40);
    L4.frame = CGRectMake(0, 500 - 40, 40, 40);
    
    L1.backgroundColor = [UIColor greenColor ];
    L2.backgroundColor = [UIColor greenColor ];
    L3.backgroundColor = [UIColor greenColor ];
    L4.backgroundColor = [UIColor greenColor ];
    
    [BV addSubview:L1];
    [BV addSubview:L2];
    [BV addSubview:L3];
    [BV addSubview:L4];
    
    UIView *CV = [[UIView alloc] init];
    CV.frame = CGRectMake(0, 0, 250, 50);
    CV.center = CGPointMake(250 / 2, 500 / 2);
    CV.backgroundColor = [UIColor orangeColor];
    [BV addSubview:CV];
    
    //各控件设置属性 让空间自动跟着 父view 变化
    L2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    L3.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    L4.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    CV.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static BOOL touch = YES;
    UIView * BV = [self.view viewWithTag:101];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:   1];

    if(touch){
        BV.frame = CGRectMake(20 ,20, 130, 250);
       
    }else{
        BV.frame = CGRectMake(20, 20, 250, 500);
       
    }
    [UIView commitAnimations];
    touch = !touch;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
