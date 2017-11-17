//
//  AppViewModel.m
//  xib的使用练习
//
//  Created by to-explore-future on 17/11/14.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "AppViewModel.h"

@implementation AppViewModel

- (instancetype)initWithDict:(NSDictionary*)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}
+ (instancetype)modelWithdict:(NSDictionary*)dict{
    return [[self alloc] initWithDict:dict];
}

@end
