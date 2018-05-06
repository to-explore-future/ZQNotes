//
//  Person.h
//  RunTimeTest
//
//  Created by sharingmobile on 2018/4/28.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    int a;
    int b;
    int c;
    int d;
}

@property(nonatomic,strong)NSArray * arr;

+ (void)eat;

+ (void)run;

- (void)sleep;

- (void)drink;

-(void)getAllIvars;

@end
