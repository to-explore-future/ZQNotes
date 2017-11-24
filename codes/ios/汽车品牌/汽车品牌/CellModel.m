//
//  CellModel.m
//  大洲分类
//
//  Created by to-explore-future on 17/11/22.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //这个方法 会自动匹配dic中与自己属性名称中相同的属性，并且设置值
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)goupWithDic:(NSDictionary *)dic{
    return  [[self alloc] initWithDic:dic];
}

@end
