//
//  main.m
//  字典对象
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSDictionary 创建不可变字典对象
        //字典对象中的元素都是键值对，key：value
        //字典中的元素是没有顺序的，但是输出的时候是 有顺序的
        
        //创建方式
        //1.
        NSDictionary *dic = @{@"one":@"1",@"two":@"2",@"three":@"3",@"four":@"4"};
        NSLog(@"dic = %@",dic);
        //2.用传入的键值对 创建初始化字典对象
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"five",@"5",@"six",@"6",@"seven",@"7", nil];
        NSLog(@"dic2 = %@",dic2);
        
        //使用已有的字典对象 初始化 一个新的字典对象
        NSDictionary *dic3 = [NSDictionary dictionaryWithDictionary:dic];
        NSLog(@"dic3 = %@",dic3);
        
        //用值的数组 和 key的数组 创建一个 字典数组
        NSArray *objects = @[@"one",@"two",@"three",@"four"];
        NSArray *keys = @[@"1",@"2",@"3",@"4"];
        NSDictionary *dic4 = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
        NSLog(@"dic4 = %@",dic4 );
        
    
        //创建空的字典对象
        NSDictionary *dic5 = [[NSDictionary alloc] init];
        NSLog(@"dic5 = %@",dic5);
        
        NSDictionary *dic6 = [NSDictionary dictionary];
        NSLog(@"dic6 = %@",dic6);
        
        //键找值
        id obj =[dic4 objectForKey:@"3"];
        NSLog(@"obj = %@",obj);
        
        NSArray * allKeys = [dic4 allKeys];
        NSLog(@"allKeys = %@",allKeys);
        
        NSArray * allValue = [dic4 allValues];
        NSLog(@"allValue = %@",allValue);
        
        //判断两个字典对象是否相同
        BOOL equal = [dic5 isEqualToDictionary:dic6];
        if(equal){
            NSLog(@"相同");
        }else{
            NSLog(@"不相同");
        }
        
        //字典的遍历
        NSEnumerator * enumerator = [dic4 keyEnumerator];
        id key = nil;
        while (key = [enumerator nextObject]) {
            NSLog(@"key-value  %@ = %@",key,[dic4 objectForKey:key  ]);
        }
      
        //快速枚举法
        for (id key2 in dic4) {
            NSLog(@"快速枚举法：key-value %@-%@",key2,[dic4 objectForKey:key2]);
        }
        
        //可变字典的操作
        NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithCapacity:30 ];
        NSLog(@"nDic = %@",mDic);
        
        //删除
        
        
        
        
    }
    return 0;
}
