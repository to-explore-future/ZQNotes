//
//  BusinessStartsModel.m
//  猜图游戏
//
//  Created by to-explore-future on 17/11/14.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "BusinessStartsModel.h"

@implementation BusinessStartsModel

-(instancetype)initWithDict:(NSDictionary *) dict{
    if (self = [super init]) {
        self.icon       = dict[@"icon"];
        self.title      = dict[@"title"];
        self.answer     = dict[@"answer"];
        self.options    = dict[@"options"];
    }
    return self;
}
+(instancetype)modelWithDict:(NSDictionary*) dict{
    return [[self alloc] initWithDict:dict];
}

@end
