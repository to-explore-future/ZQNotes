//
//  AppViewModel.h
//  xib的使用练习
//
//  Created by to-explore-future on 17/11/14.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppViewModel : NSObject

@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * icon;

- (instancetype)initWithDict:(NSDictionary*)dict;
+ (instancetype)modelWithdict:(NSDictionary*)dict;

@end
