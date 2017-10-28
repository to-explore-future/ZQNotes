//
//  ViewController.m
//  导航控制器动画
//
//  Created by to-explore-future on 17/10/28.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "vc2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"首页";
    
    _image = [UIImage imageNamed:@"0016.jpg"];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    iv.image = _image;
    [self.view addSubview:iv];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CATransition *ct = [CATransition animation];
    ct.duration = 0.8;
    ct.type = @"rippleEffect";
    ct.subtype = kCATransitionFromRight;
    ct.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.navigationController.view.layer addAnimation:ct forKey:nil];
    
    vc2 *vc = [[vc2 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
