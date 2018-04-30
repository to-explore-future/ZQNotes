//
//  ZQCustomView.m
//  ios-customview
//
//  Created by sharingmobile on 2018/4/26.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "ZQCustomView.h"

#define PI 3.141592657

@implementation ZQCustomView

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

//这个
-(void)drawRect:(CGRect)rect{
    //1.getGraphics current context
    // many the parameters needed to draw are defined here.
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
#pragma mark - 画圆
//    描边圆
    CGContextSetRGBStrokeColor(context, 0, 1, 1, 1.0);
    CGContextSetLineWidth(context, 10);
    CGContextAddArc(context, 100, 100, 20, 0, 2 * PI, 1);
    CGContextDrawPath(context, kCGPathStroke);
    
//    填充圆 ,无边框
    CGContextSetRGBFillColor(context, 3, 0, 0, 1.0);
    CGContextAddArc(context, 150, 100, 20, 0, 2*PI, 1);
    CGContextDrawPath(context, kCGPathFill);
    
//    填充圆,有边框
    CGContextSetRGBFillColor(context, 0, 1, 0, 1.0);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1.0);
    CGContextSetLineWidth(context, 10);
    CGContextAddArc(context, 200, 100, 20, 0, 2*PI, 0);
    CGContextDrawPath(context, kCGPathFillStroke);
    
#pragma mark - 线以及弧
    CGPoint points[4];//坐标点
    points[0] = CGPointMake(30, 130);
    points[1] = CGPointMake(60, 130);
    points[2] = CGPointMake(60, 140);
    points[3] = CGPointMake(30, 140);
    CGContextSetLineWidth(context, 2);
    CGContextAddLines(context, points, 4);
    CGContextDrawPath(context, kCGPathStroke);
    
    //画笑脸弧线
    //每个网格的距离
    CGFloat offsetX = 20;
    CGFloat offsetY = 20;
    CGFloat arcRadius = 20;
    //第一个点
    CGFloat oneX1 = 100;
    CGFloat oneY1 = 200;
    CGFloat oneX2 = oneX1 + offsetX;
    CGFloat oneY2 = oneY1 - offsetY;
    CGFloat oneX3 = oneX1 + 2 * offsetX;
    CGFloat oneY3 = oneY1;
    
    //检测点的位置
//    CGPoint onePoints[3];
//    onePoints[0] = CGPointMake(oneX1, oneY1);
//    onePoints[1] = CGPointMake(oneX2, oneY2);
//    onePoints[2] = CGPointMake(oneX3, oneY3);
//    CGContextSetLineWidth(context, 2);
//    CGContextAddLines(context, onePoints, 3);
//    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextMoveToPoint(context, oneX1, oneY1);
    CGContextAddArcToPoint(context, oneX2, oneY2, oneX3, oneY3, arcRadius);
    CGContextStrokePath(context);
    
    
}

@end
