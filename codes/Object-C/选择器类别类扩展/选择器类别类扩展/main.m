//
//  main.m
//  选择器类别类扩展
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "NSString+reverseString.h"
/*
 1.选择器：一种发送消息的机制,通过 @selector(方法名) 或者 创建SEL 类型变量的调用来执行方法
 C语言函数指针
 
 
 */

int add(int a ,int b){
    return a +b;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //直接通过函数名调用函数
        NSLog(@"add = %d",add(3, 5));
        //通过函数指针调用函数
        int (*p)(int,int) = add;
        NSLog(@"add = %d",p(3,5));
       
        //1.
        //OC中的选择器 很像C语言中的函数指针，通过选择器调用函数，发送消息。
        SEL sel = @selector(eat);
        Dog *d1 = [[Dog alloc] init];
        //去掉内存泄露的提示
        # pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if([d1 respondsToSelector:sel] ){//测试sel是否实现
            //sel是一个selector，类似于C语言的一个指针，指向eat方法·
            [d1 performSelector:sel];//执行sel
            [d1 eat];
        }
        
        
        //2.
        //使用方法名称的OC字符串格式 生成选择器
        SEL sel2 = NSSelectorFromString(@"bark:");
        if([d1 respondsToSelector:sel2]){
            [d1 performSelector:sel2 withObject:[NSNumber numberWithInt:5]];
        }
        
        //3.
        //使用方法名称的C语言字符串格式 生成选择器
        SEL sel3 = sel_getUid("bark:");
        if([d1 respondsToSelector:sel3]){
            [d1 performSelector:sel3 withObject:[NSNumber numberWithInt:5]];
        }
        
        //获取选择器中方法的名称
        //获取名称字符串对象
        NSLog(@"name = %@",NSStringFromSelector(sel3));
        
        //获取名称字符串
        NSLog(@"name = %s",sel_getName(sel3));
        
        //学习了以上的知识 就对 数组排序 更加理解了
        NSArray * array = @[@"小明",@"tom",@"back",@"lim",@"zimi"];
        [array sortedArrayUsingSelector:@selector(compare:)];
        
        
        //类别：主要是给类扩展方法
        // 通常：类中提供的方法不符合我们的需求的时候，这个时候给这个类扩展方法
        //类别只能扩展 放法 不能扩展实例变量
        
        //运用扩展的知识 给NSSting 添加一个字符串反转的方法
        NSString* nStr = [NSString reverseString:@"我是中国人"];
        NSLog(@"nStr = %@",nStr);
        //类别就是 以上的一套逻辑
        //还有一套逻辑 叫做类扩展 类别和类扩展很相似
        /*
         类别：@interface NSString (reverseString)
         类扩展：@interface Dog ()  到.m 文件中添加
         */

        Dog * dog = [[Dog alloc] init];
        dog.name = @"小黑";
        [dog printInformation];
        
    }
    return 0;
}
