//
//  App.h
//  Xib的使用
//
//  Created by to-explore-future on 17/11/13.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject

@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * icon;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appWithDict:(NSDictionary *)dict;

@end
