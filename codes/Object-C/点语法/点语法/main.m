//
//  main.m
//  点语法
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc]initName:@"zq" andAge:28];
        NSLog(@"name=%@,age=%li",p.name1,p.age);
        //OC中关于 点 的使用，如果OC中有get方法，就可以使用 点
        //这种形式如果放在 = 的左边就是 给这个 get方法中的变量赋值
        //如果直接调用就是：直接调用 OC中的get方法
        //经过验证 这种 点 调用 ，针对的是 setXXX，getXXX方法，
        // 点 后面的 名称 一定要和 XXX吻合；
        NSLog(@"changed--name-%@,age=%li",p.names = @"liyang",p.age = 30);
        NSLog(@"name=%@,age=%li",p.name1,p.age);
        
        //测试 @property @synthsize 关键字的作用
        Person *p1 = [[Person alloc] init];
        NSLog(@"address = %@,weight = %d",p1.address = @"鸿悦国际",60);
        
        //私有成员的变量的测试,这个变量只在 *.m中有 ，在*.h 中没有
        NSLog(@"livePlace = %@,height = %li",p1.livePlace = @"maGeZhuang",p1.height = 180);
        
        /*
         
         @property(nonatomic,copy)NSString * Name;
         
         @property(assign,nonatomic)NSInteger age;
         
         @property(nonatomic,retain)NSArray * array;
         
         @property (setter=setterPlace:,getter=getterPlace)NSString *place;
         */
        Student *stu = [[Student alloc] init];
        stu.Name = @"小明";
        stu.age = 20;
        stu.place = @"北京";
        [stu setterPlace:@"上海"];
        NSLog(@"name = %@,age = %li,place = %@",stu.Name,stu.age,stu.place);
        NSArray *scores = [NSArray arrayWithObjects:@"98",@"99",@"99", nil];
        
    }
    return 0;
}
