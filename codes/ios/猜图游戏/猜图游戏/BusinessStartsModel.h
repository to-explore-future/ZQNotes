//
//  BusinessStartsModel.h
//  猜图游戏
//
//  Created by to-explore-future on 17/11/14.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessStartsModel : NSObject

@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * icon;
@property(nonatomic,copy)NSString * answer;
@property(nonatomic,copy)NSString * options;

//搞这个 数据模型
-(instancetype)initWithDict:(NSDictionary *) dict;
+(instancetype)modelWithDict:(NSDictionary*) dict;

@end
