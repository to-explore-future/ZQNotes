//
//  Utils.m
//  baidufanyiTest
//
//  Created by sharingmobile on 2018/2/23.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "Utils.h"

@implementation Utils


/**
 *  对 uiColor 的封装
 */
+(UIColor*)getColorWithRed:(int)red Green:(int)green Blue:(int)blue Alpha:(float)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha/1.0];
}


/**
 *  对 uiColor 的封装 alpha 默认为1
 */
+(UIColor*)getColorWithRed:(int)red Green:(int)green Blue:(int)blue{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

/**
 *  好多时候 取色都是 r g b 相同
 */
+(UIColor*)getColorWithOneValue:(int)value{
    return [UIColor colorWithRed:value/255.0 green:value/255.0 blue:value/255.0 alpha:1.0];
}

/**
 *  设置圆角
 */
+(void)setViewCorner:(UIView *)someView withNSOptions:(UIRectCorner)corner withCornerRadii:(CGSize)size{
    
    [someView layoutIfNeeded];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:someView.bounds byRoundingCorners:corner cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = someView.bounds;
    maskLayer.path = maskPath.CGPath;
    someView.layer.mask = maskLayer;
}
/**
 *  得到一个可可以释放的UIImage
 */
+(UIImage*)getImageByPathWithImageName:(NSString*)imageName {
    NSString * imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}



@end
