//
//  App.m
//  Xib的使用
//
//  Created by to-explore-future on 17/11/13.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "App.h"

@implementation App

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+(instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
