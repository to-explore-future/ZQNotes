//
//  ViewController.m
//  UILabel
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//一个label
- (void)creatUI_label{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"你好世界faffgadsfasdfadfsdf";
    label.font = [UIFont systemFontOfSize:19];
    label.textColor = [UIColor redColor];
    label.frame = CGRectMake(100, 100, 200, 50);
    label.backgroundColor = [UIColor greenColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    //label 的高级属性
    label.shadowColor = [UIColor grayColor];
    label.shadowOffset = CGSizeMake(-3, -2);
    //设置文字居中
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 5;
    
}

//一个button
- (void)creatUI_button{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 200, 200, 50);
    [btn setTitle:@"未按" forState:UIControlStateNormal];
    [btn setTitle:@"按下" forState:UIControlStateHighlighted];
    btn.backgroundColor  = [UIColor grayColor];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    //设置按钮的风格颜色
    [btn setTintColor:[UIColor whiteColor]];
    
    //字体
    btn.titleLabel.font = [UIFont systemFontOfSize:19];
    
    [self.view addSubview:btn];
    
}

//可以创建图片的button
- (void) createImageButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, 50, 50);
    UIImage * icon1 = [UIImage imageNamed:@"btn1.jpg"];
    UIImage * icon2  =[UIImage imageNamed:@"btn2.jpg"];
    
    [btn setImage:icon1 forState:UIControlStateNormal   ];
    [btn setImage:icon2 forState:UIControlStateHighlighted];
    btn.tag = 101;
    [self.view addSubview:btn   ];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];

}

//给按钮添加事件
- (void)btnWithAction{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 300, 100, 100);
    [btn setTitle:@"按钮事件" forState:UIControlStateNormal];
    
    //UIControlEventTouchUpInside--outside
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.tag = 100;
}

//带着参数 可以知道 是哪个按钮
- (void)pressBtn:(UIButton*)btn{
    if(btn.tag == 101){
       NSLog(@"btn 101 按钮被按下了");
    }
    
    if(btn.tag == 100){
        NSLog(@"btn 100 按钮被按下了");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self creatUI_label];
    [self creatUI_button];
    [self createImageButton];
    [self btnWithAction];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
