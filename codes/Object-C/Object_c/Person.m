//
//  Person.m
//  Object_c
//
//  Created by to-explore-future on 17/10/16.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)init
{
    self = [super init];
    if (self) {
        _name = @"小费";
        _age = 22;
    }
    return self;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)setAge:(NSInteger)age
{
    _age = age;
}

- (void)setName:(NSString *)name andAge:(NSInteger)age
{
    _name = name;
    _age = age;
}

-(NSString *)name
{
    return _name;
}

- (NSInteger)age
{
    return _age;
}

- (void)print
{
    // 省略了 self->
    NSLog(@"name = %@,age = %li",_name,_age);
    // 间接访问
    NSLog(@"name = %@,age = %li",[self name],[self age]);
    //
    NSLog(@"name = %@,age = %li",self->_name,self->_age);
}

//测试当前类是否可用
+ (void)testPerson
{
    Person *per = [[Person alloc] init];
    //分开写
//    Person * per = [Person alloc];
//    per = [per init];
    
    [per print];
}

@end
