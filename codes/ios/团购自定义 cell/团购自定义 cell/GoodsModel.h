//
//  GoodsModel.h
//  团购自定义 cell
//
//  Created by to-explore-future on 17/11/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property(nonatomic,strong)NSString * buyCount;
@property(nonatomic,strong)NSString * icon;
@property(nonatomic,strong)NSString * price;
@property(nonatomic,strong)NSString * title;

-(instancetype)initWithDic:(NSDictionary *)dic;

+(instancetype)modelWithDic:(NSDictionary *)dic;

@end
