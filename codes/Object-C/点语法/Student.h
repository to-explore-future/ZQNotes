//
//  Student.h
//  点语法
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
//属性修饰符

// assgin copy retain 是一组 属于 并列关系，一个数据只能同时 由其中一个来修饰
// assgin(缺省)：直接赋值 修饰基本数据类型
// copy 先release 再copy(先释放就得对象，在拷贝新的副本) 修饰字符串类型
// retain 先release 在retain 修饰 除了 基本数据类型和字符串 类型以外的 数据类型


// 非原子性的        原子性的  在多线程中使用
// 为了防止 内存泄露 或者 实例取值错误，为了提高访问实例变量的访问效率，通常使用 nonatomic
// nonatomic        atomic(缺省)

// setter ：给setter方法重新命名 getter 给getter方法重新命名
// setter getter

@property(nonatomic,copy)NSString * Name;

@property(assign,nonatomic)NSInteger age;

@property(nonatomic,retain)NSArray * array;

@property (setter=setterPlace:,getter=getterPlace)NSString *place;

//只读 之展开了 get方法，没有展开set方法
@property(readonly)NSInteger score;

//同时展开 set get方法 ，可读可写
@property(readwrite)NSString * company;

@end
