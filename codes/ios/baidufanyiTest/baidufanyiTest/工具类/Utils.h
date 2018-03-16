//
//  Utils.h
//  baidufanyiTest
//
//  Created by sharingmobile on 2018/2/23.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

/**
 *  对 UIColor 的封装
 */
+(UIColor*)getColorWithRed:(int)red Green:(int)green Blue:(int)blue Alpha:(float)alpha;


/**
 *  对 UIColor 的封装 alpha 默认为1
 */
+(UIColor*)getColorWithRed:(int)red Green:(int)green Blue:(int)blue ;

/**
 *  好多时候 取色都是 r g b 相同
 */
+(UIColor*)getColorWithOneValue:(int)value;

/**
 *  设置圆角
 */
+(void)setViewCorner:(UIView *)someView withNSOptions:(UIRectCorner)corner withCornerRadii:(CGSize)size;

/**
 *  生成一个能够释放的 uiImage ,这种方式生成的 Image 不会再内存中长留
 *  注意：带着文件的后缀名
 */
+(UIImage*)getImageByPathWithImageName:(NSString*)imagePath;

@end
