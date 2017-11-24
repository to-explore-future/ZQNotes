//
//  GoodsModel.m
//  团购自定义 cell
//
//  Created by to-explore-future on 17/11/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init ]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)modelWithDic:(NSDictionary *)dic{
    return [[GoodsModel alloc] initWithDic:dic];
}

@end
