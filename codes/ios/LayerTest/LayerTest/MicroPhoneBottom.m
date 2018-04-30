//
//  MicroPhoneBottom.m
//  LayerTest
//
//  Created by sharingmobile on 2018/4/27.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "MicroPhoneBottom.h"

#define PI 3.141592657

@implementation MicroPhoneBottom

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.frame = frame;
    if (self) {
        [self setBackgroundColor:[UIColor greenColor]];
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat lineWidth = 10;
    
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetRGBFillColor(context, 1, 0, 0, 1.0);
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    
    //第一段线
    CGPoint aPoints[2];
    aPoints[0] =CGPointMake(0 + lineWidth / 2, 0);
    aPoints[1] =CGPointMake(0 + lineWidth / 2, H / 4);
    CGContextAddLines(context, aPoints, 2);
    CGContextDrawPath(context, kCGPathStroke);
    
    //第二个线段
    CGPoint aPoints2[2];
    aPoints2[0] =CGPointMake(W - lineWidth / 2, 0);
    aPoints2[1] =CGPointMake(W - lineWidth / 2, H / 4);
   
    CGContextAddLines(context, aPoints2, 2);
    CGContextDrawPath(context, kCGPathStroke);
    
    //第一个圆弧
    CGContextAddArc(context, W / 2, H / 4, H / 2 - lineWidth / 2, 0, PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke);
    
    //第三条线
    CGPoint aPoints3[2];
    aPoints3[0] =CGPointMake(W / 2, H / 4 * 3);
    aPoints3[1] =CGPointMake(W / 2, H );
    
    CGContextAddLines(context, aPoints3, 2);
    CGContextDrawPath(context, kCGPathStroke);
    
    //第四条线
    CGPoint aPoints4[2];
    aPoints4[0] =CGPointMake( W / 4 , H - lineWidth / 2);
    aPoints4[1] =CGPointMake( W / 4 * 3, H  - lineWidth / 2);
    
    CGContextAddLines(context, aPoints4, 2);
    CGContextDrawPath(context, kCGPathStroke);
}

@end
