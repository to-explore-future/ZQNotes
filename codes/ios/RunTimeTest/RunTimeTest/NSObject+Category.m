//
//  NSObject+Category.m
//  RunTimeTest
//
//  Created by sharingmobile on 2018/5/2.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

@implementation NSObject (Category)

char nameKey;

- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *) name{
    return objc_getAssociatedObject(self, &nameKey);
}



@end
