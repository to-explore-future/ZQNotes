//
//  Person.m
//  RunTimeTest
//
//  Created by sharingmobile on 2018/4/28.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

+ (void)load{
    NSLog(@"load");
    Method m1 = class_getClassMethod([Person class], @selector(eat));
    Method m2 = class_getClassMethod([Person class], @selector(run));
    method_exchangeImplementations(m1, m2);
    
    Method m3 = class_getInstanceMethod([Person class], @selector(sleep));
    Method m4 = class_getInstanceMethod([Person class], @selector(drink));
    method_exchangeImplementations(m3, m4);
}

+(void)eat{
    NSLog(@"吃饭");
}

+(void)run{
    NSLog(@"跑步");
}

- (void)sleep{
    NSLog(@"睡觉");
}

- (void)drink{
    NSLog(@"喝多了");
}

@end
