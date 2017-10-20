//
//  NSString+reverseString.m
//  选择器类别类扩展
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "NSString+reverseString.h"

@implementation NSString (reverseString)

+(NSString *)reverseString:(NSString *)str{
    
    NSMutableString * string = [[NSMutableString alloc] init];
    for (NSInteger i = str.length - 1; i>=0; i--) {
        [string appendString:[NSString stringWithFormat:@"%C",[str characterAtIndex:i]]];
    }
    return string;
}

@end
