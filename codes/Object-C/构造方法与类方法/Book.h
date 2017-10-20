//
//  Book.h
//  构造方法与类方法
//
//  Created by to-explore-future on 17/10/16.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
{
    NSString * _name;
    float _price;
}

//构造方法

//不带参数
- (id)init;

//带一个参数
- (id)initWithName:(NSString *)name;
- (id)initWithAge:(float)price;

//带两个参数
- (id)initWithName:(NSString *)name andPrice:(float)price;

-(NSString *)name;
-(float)price;

//类方法创建对象
+ (id)bookCreat;
+ (id)bookCreatWithName:(NSString *)name;
+ (id)bookCreatWithName:(NSString *)name andPrice:(float)price;


@end
