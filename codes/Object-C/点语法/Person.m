//
//  Person.m
//  点语法
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "Person.h"

@implementation Person

- (Person*)init{
    Person *p = [Person alloc];
    return p;
}
- (Person *)initName:(NSString *)name andAge:(NSInteger)age{
    Person *p = [Person alloc];
    _name = name;
    _age = age;
    return p;
}

- (void)setNames:(NSString*)name{
    _name = name;
}

- (void)setAge:(NSInteger)age{
    _age = age;
}

- (NSString*)name1{
    return _name;
}
- (NSInteger)age{
    return _age;
}

// 到了这里面实现set ，get方法 麻烦吧 使用关键字
// 两个weight 意思：weight 是*.h文件中的 weight方法
// weight方法对应着 _weight 关键字
@synthesize weight = _weight;
@synthesize address = _address;



@end
