//
//  ViewController.m
//  警告对话框和等待提示器
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize alertView = _alertView;
@synthesize indicatorView = _indicatorView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton* btn1 =  [[UIButton alloc] init];
    btn1.frame = CGRectMake(100, 200, 100, 30);
    btn1.backgroundColor = [UIColor orangeColor];
    [btn1 setTitle:@"alert" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btn2 =  [[UIButton alloc] init];
    btn2.frame = CGRectMake(100, 400, 100, 30);
    [btn2 setTitle:@"indicator" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    btn2.backgroundColor = [UIColor orangeColor];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btn1{
    [self aboutAlertView];
}

-(void)btn2{
    [self aboutIndicatorView];
}

- (void)aboutAlertView{
    //选项id cancelButton 0 outerTitles 1 ...
    //delegate :代理协议 1.XXX.h<UIAlertViewDelegate>
    //2.nil --> self
    _alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"你老婆生气了！" delegate:self cancelButtonTitle:@"不管她" otherButtonTitles:@"知道了",@"这就去",@"正在忙", nil];
    [_alertView show];
    
    
}

//协议函数，当点击对话框按钮时，调用此函数
// P1:对话框本身
// P2:按钮的索引
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"第 %li 个按钮被点击",(long)buttonIndex);
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"Alert对话框--即将消失");
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonInde{
    NSLog(@"Alert对话框--已经消失");
}


- (void)aboutIndicatorView{
    NSLog(@"zou");
    if(_indicatorView == nil){
        _indicatorView = [[UIActivityIndicatorView alloc] init];
        _indicatorView.frame = CGRectMake(100, 100, 100, 100);
        _indicatorView.activityIndicatorViewStyle = UIScrollViewIndicatorStyleWhite;
        [self.view addSubview:_indicatorView];
        [_indicatorView startAnimating];
    }else{
//        [_indicatorView hidesWhenStopped];
        [_indicatorView stopAnimating];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
