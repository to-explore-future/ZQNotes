//
//  main.m
//  数组的操作
//
//  Created by to-explore-future on 17/10/17.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1.OC中数组中的元素 可以为不同类型的对象，但是Java中不可以
        NSArray *array1 = @[@"one",@"two",@"three",[NSNumber numberWithInt:123]];
        NSLog(@"array1 = %@",array1);
        
        // 2.实例方法创建对象
        NSArray *array2 = [[NSArray alloc] init];
        NSLog(@"array2 = %@",array2);
        
        // 3.传入数组的元素创建数组对象
        NSArray *array3 = [[NSArray alloc] initWithObjects:@"one",@"two",@"three",[NSNumber numberWithInt:123], nil];
        NSLog(@"array3 = %@",array3);
        
        // 4.数组的拷贝
        NSArray *array4 = [[NSArray alloc] initWithArray:array3];
        NSLog(@"array4 = %@",array4);
        
        // 通过类方法，名称一样
        // array arrayWithObjects arrayWithArray arrayWithObjects
        
        //打印数组的元素个数
        NSInteger count = [array1 count];
        NSLog(@"count = %li",count);
        
        //获取对象在数组中的位置
        NSInteger indexOfObject = [array1 indexOfObject:@"two"];
        NSLog(@"“two”在数组中的位置:%li",indexOfObject);
        
        //获取数组中指定位置的对象
        id objectAtIndex = [array1 objectAtIndex:1];
        NSLog(@"在下标 1 位置的元素是：%@",objectAtIndex);
        
        //获取第一个元素 最后一个元素
        NSLog(@"最后一个元素：%@", [array1 lastObject]);
        NSLog(@"第一个元素：%@", [array1 firstObject]);
        
        
        //数组的比较
        
        NSArray *array10 = @[@"one",@"two",@"three",@"four"];
        NSArray *array11 = [NSArray arrayWithObjects:/*@"one",*/@"two",@"three", nil];
        //判断数组是否相等
        BOOL isEqual = [array10 isEqualToArray:array11];
        if(isEqual){
            NSLog(@"array10 和 array11 相等");
        }else{
            NSLog(@"array10 和 array11 不相等");
        }
        
        //获取两个数组中第一个相同的元素
        // 查找规则:第一个数组中的第一个元素 和 第二个数组中的所有元素一次比较 ，如果发现相同返回这个元素，如果没有相同， 第一个数组中的第二个元素 。。。
        id firstObject = [array10 firstObjectCommonWithArray:array11];
        NSLog(@"第一个相同的元素是：%@",firstObject);
        
        
        //数组的排序:排序中的数组的元素都是相同的数据类型
        NSArray *array12 = @[@"one",@"two",@"three",@"four"];
        NSArray *sortedArray = [array12 sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"sortedArray:%@",sortedArray);
    }
    return 0;
}
