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
    //获得类方法
    Method m1 = class_getClassMethod([Person class], @selector(eat));
    Method m2 = class_getClassMethod([Person class], @selector(run));
    method_exchangeImplementations(m1, m2);
    
    //获取实例方法
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

-(void)getAllIvars{
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([Person class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名:%s,成员变量类型:%s",name,type);
    }
}



@end
