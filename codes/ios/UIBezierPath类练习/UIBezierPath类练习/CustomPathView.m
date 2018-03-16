//
//  CustomPathView.m
//  UIBezierPath类练习
//
//  Created by sharingmobile on 2018/3/7.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "CustomPathView.h"

@implementation CustomPathView



-(void)drawRect:(CGRect)rect{
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(50, 100)];
    [bezierPath addLineToPoint:CGPointMake(100, 100)];
    [bezierPath addLineToPoint:CGPointMake(200, 200)];
    [bezierPath addLineToPoint:CGPointMake(200, 300)];
    [bezierPath addLineToPoint:CGPointMake(150, 400)];
    bezierPath.lineWidth = 3;
    
    //这条折线就画到这里
    //这里搞一条 返回去的线
    UIBezierPath * reversingPath = [bezierPath bezierPathByReversingPath];
    reversingPath.lineWidth = 1;
    
    //为了避免两条线 重合在一起 对一条线进行平移
    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 0);
    [bezierPath applyTransform:transform];
    
    //怎么测试这个路径确实是反转路径呢
    CGPoint lastPoint =  CGPointMake(150, 500);
    [bezierPath addLineToPoint:lastPoint];
    [reversingPath addLineToPoint:lastPoint];
    
    //设置两个path的颜色
    [[UIColor redColor] set];//把这个颜色赋值给当前的正在绘制的内容
    [bezierPath stroke];
    
    [[UIColor greenColor] set];
    [reversingPath stroke];
    
    //练习绘制虚线
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0,600)];
    [path1 addLineToPoint:CGPointMake(self.frame.size.width, 600)];
    path1.lineWidth = 2;
    CGFloat dashLineConfig [] = {18.0 ,4.0};
    [path1 setLineDash:dashLineConfig count:2 phase:0];
    
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(0, 650)];
    [path2 addLineToPoint:CGPointMake(self.frame.size.width, 650)];
    path2.lineWidth = 2;
    CGFloat dashLineConfig1 [] = {8.0 ,4.0,2.0,1.0,0.5};
    /**
     *  count : 表示要执行float 数组中的几个长度 ,count 不要大于数组的长度，
     *  当count小于或者等于 数组的长度的时候，虚线就会 按照 实虚实虚依次按照数组中的前count个数 交替绘制
     */
    [path2 setLineDash:dashLineConfig1 count:5 phase:10];
    
    [[UIColor orangeColor] set];
    [path1 stroke];
    [path2 stroke];
    
    //创建path的几种方式
    //1.根据rect 创建 其实这种方式 只是选取了 rect的四个点 连线而已
    UIBezierPath * pathByRect = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 200)];
    pathByRect.lineWidth = 2;
    [[UIColor purpleColor] set];
    [pathByRect stroke];
    
    //2.根据rect 创建一个椭圆形的path
    UIBezierPath * pathByRectToOval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    pathByRectToOval.lineWidth = 2;
    [[UIColor darkGrayColor] set];
    [pathByRectToOval stroke];
    
    //2.绘制一个 带着圆角的 矩形 path
    UIBezierPath * pathByCornerRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(110, 110, 180, 180) cornerRadius:30];
    pathByCornerRect.lineWidth = 2;
    [[UIColor redColor] set];
    [pathByCornerRect stroke];
}

@end
