//
//  ViewController.m
//  手势判断移动图片
//
//  Created by to-explore-future on 17/10/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage * image = [UIImage imageNamed:@"006.jpg"];
    UIImageView *ivImage = [[UIImageView alloc] initWithImage:image];
    ivImage.frame = CGRectMake(0, 0, 320, 570);
    ivImage.tag = 102;
    [self.view addSubview:ivImage];
    
    
    //第一次进入获取图片的 原点
    CGFloat x = ivImage.bounds.origin.x;
    CGFloat y = ivImage.bounds.origin.y;
    _ImagePoint = CGPointMake(x, y);
}

/*
 类的继承关系  UIViewController extends UIResponder
 UIResponder 四个方法
 - (void)touchesBegan:
 - (void)touchesMoved:
 - (void)touchesEnded:
 - (void)touchesCancelled:
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch =  [touches anyObject];
    
    //获取 着陆点
    _touchPoint = [touch locationInView:self.view];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    
    UIImageView *ivImage = (UIImageView*)[self.view viewWithTag:102];
    //只负责 移动距离
    CGPoint nowPoint = [touch locationInView:self.view];
    _distanceX = nowPoint.x - _touchPoint.x;
    _distanceY = nowPoint.y - _touchPoint.y;
    //在现在图片的 原点 的基础上 移动图片
    ivImage.frame = CGRectMake(_ImagePoint.x + _distanceX,_ImagePoint.y + _distanceY, 320, 570);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"手指离开");
    UITouch * touch = [touches anyObject];
    _unTouchPoint = [touch locationInView:self.view];
    //这个时候图片的 原点 发生了变化
    _ImagePoint = CGPointMake(_ImagePoint.x + _distanceX, _ImagePoint.y +_distanceY);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchu 被终止");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
