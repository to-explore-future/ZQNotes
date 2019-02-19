//
//  WBLibS.m
//  NSTime
//
//  Created by haoqiao on 17/5/12.
//  Copyright © 2017年 haoqiao. All rights reserved.
//

#import "WBLibS.h"

#define FONT(_size)  [UIFont systemFontOfSize:_size]
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//当前窗口的高度 宽度
#define SCREEN_Height [[UIScreen mainScreen] bounds].size.height
#define SCREEN_Width  [[UIScreen mainScreen] bounds].size.width

static WBLibS * user = nil;

@implementation WBLibS

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (user == nil) {
            user = [super allocWithZone:zone];
        }
    });
    return user;
}

// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone{
    return user;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return user;
}

+(instancetype)WBLibs{
//    if (user == nil) {
//        NSLog(@"创建了新的 wblibs");
//        return [[self alloc]init];
//    }
//    NSLog(@"使用了旧的 wblibs");
//    NSLog(@"wblibs 内存地址%ld",&self);
//    return user;
    
    NSLog(@"wblibs 内存地址%ld",&self);
    return [[self alloc]init];
}




@end
