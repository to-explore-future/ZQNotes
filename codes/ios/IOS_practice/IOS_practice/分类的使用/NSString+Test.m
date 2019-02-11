//
//  NSString+Test.m
//  IOS_practice
//
//  Created by haoqiao on 2019/2/1.
//  Copyright © 2019 zq. All rights reserved.
//

#import "NSString+Test.h"

@implementation NSString (Test)

+ (NSString *)OneString:(NSString *)string plusAnotherString:(NSString *)anotherString{
    return [self stringWithString:anotherString];
}

@end
