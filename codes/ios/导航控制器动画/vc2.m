//
//  vc2.m
//  导航控制器动画
//
//  Created by to-explore-future on 17/10/28.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "vc2.h"
#import "ViewController.h"

@interface vc2 ()

@end

@implementation vc2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationItem.title = @"vc2";
    UIImage *image = [UIImage imageNamed:@"007.jpg"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    iv.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:iv];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CATransition *ct = [CATransition animation];
    ct.duration = 0.8;
    /*
     动画类型：
     cube(盒子翻转),moveIn,reveal,fade(default),pageCurl,suckEffect(有点像mac的神奇效果的反方向),rippleEffect(水波纹效果),oglFlip(中心轴旋转),
     */
    ct.type = @"rippleEffect";
    /*
     从哪个方向 翻转
     fromLeft,fromRight,fromTop,fromBottom
     */
    ct.subtype = kCATransitionFromLeft;
    /*
     管理动画的展示速度 有点像 Android 的插值器
     */
    ct.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.navigationController.view.layer addAnimation:ct forKey:nil];
    
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
