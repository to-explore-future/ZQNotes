//
//  Book.m
//  构造方法与类方法
//
//  Created by to-explore-future on 17/10/16.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "Book.h"

@implementation Book

- (id)init{
    self = [super init];//构造方法要 初始化父类
    if(self){
        _name = @"无参初始化";
        _price = 33.33;
    }
    return self;//构造方法一定要 返回
}

- (id)initWithName:(NSString *)name{
    if(self = [super init]){
        _name = name;
    }
    return self;
}

- (id)initWithName:(NSString *)name andAge:(float)price{
    if(self = [super init]){
        _name = name;
        _price = price;
    }
    return self;
}

- (NSString *)name{
    return _name;
}

- (float)price{
    return _price;
}


+ (id)bookCreat{
    Book* book = [[Book alloc] init];
    return book;
}
+ (id)bookCreatWithName:(NSString *)name{
    Book * book = [[Book alloc] initWithName:@"红楼梦"];
    return book;
}

+(id)bookCreatWithName:(NSString *)name andPrice:(float)price{
    id book = [[self alloc] init];
    ((Book *)book)->_name = name;
    ((Book *)book)->_price = price;
    return book;
}

@end
