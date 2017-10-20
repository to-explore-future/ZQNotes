//
//  main.m
//  可变数组
//
//  Created by to-explore-future on 17/10/18.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //1.可变数组的创建
       NSMutableArray *mutableArray =  [[NSMutableArray alloc] initWithObjects:@"one",@"two", nil];
        NSLog(@"nutableArray = %@",mutableArray);
        
        //初始化指定容量大小的可变数组
        NSMutableArray *mutableArray1 = [[NSMutableArray alloc] initWithCapacity:20];
        NSMutableArray *mutableArray2 = [NSMutableArray arrayWithCapacity:20];
        NSLog(@"mutableArray1 = %@\nmutableArray2 = %@",mutableArray1,mutableArray2);
        
        //添加元素
        //添加一个元素
        [mutableArray addObject:@"three"];
        NSLog(@"mutableArray = %@",mutableArray);
        
        //添加一个数组
        [mutableArray addObjectsFromArray:mutableArray2];
        NSLog(@"mutableArray = %@",mutableArray);
        
        //在指定位置添加元素
        [mutableArray insertObject:@"four" atIndex:3];
        NSLog(@"mutableArray = %@",mutableArray);
        
        //在制定下边的多个位置添加元素
        NSArray * arr = @[@"小米",@"华为",@"Google"];
        NSLog(@"arr = %@",arr);
        
       NSArray * arr1 =  [NSArray arrayWithObjects:@"小米",@"华为",@"Google", nil];
        NSLog(@"arr1 = %@",arr1);
        NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSetWithIndex:1];
        [indexSet addIndex:3];
        [indexSet addIndex:5];
        [mutableArray insertObjects:arr atIndexes:indexSet ];
        NSLog(@"mutableArray = %@",mutableArray);
        
        //修改重置数组对象
        [mutableArray setArray:arr];
        NSLog(@"mutableArray = %@",mutableArray);
        
        //替换数组中的一个元素
        [mutableArray replaceObjectAtIndex:2 withObject:@"toExploreFuture"];
        NSLog(@"mutableArray = %@",mutableArray);
        
        //通过一个数组替换
        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)];
        [mutableArray replaceObjectsAtIndexes:set withObjects:@[@"1",@"2"]];
        NSLog(@"mutableArray = %@",mutableArray);
        
        //数组中的两个元素进行互换
        [mutableArray exchangeObjectAtIndex:0 withObjectAtIndex:2];
        NSLog(@"mutableArray = %@",mutableArray);
        
        //删除数组中的元素
        [mutableArray removeObject:@"1"];
        NSLog(@"mutable = %@",mutableArray);
        
        //如果数组中有多个 相同的元素  都会进行删除
        [mutableArray addObject:@"3"];
        [mutableArray addObject:@"3"];
        [mutableArray removeObject:@"3"];
        NSLog(@"mutableArray = %@",mutableArray);

        //删除指定下标的元素
        [mutableArray removeObjectAtIndex:0];
       NSLog(@"mutableArray = %@",mutableArray);
        
        //删除数组中的所有元素
//        mutableArray removeAllObjects
//        mutableArray removeLastObject
        
        //删除指定范围内的符合要求的数组 元素
        
        //删除所有的在传入数组中出现的元素
        NSMutableArray * arr2 =  [NSMutableArray arrayWithObjects:@"小米",@"华为",@"Google",@"微软",@"intel",@"英伟达", nil];
        [arr2 removeObjectsInArray:@[@"小米"]];
        NSLog(@"arr2 = %@",arr2);
        
        //数组排序
        NSMutableArray *sortArray = [NSMutableArray arrayWithArray:@[@"one",@"two",@"three",@"four",@"five"]];
        [sortArray sortUsingSelector:@selector(compare:)];
        NSLog(@"sortArray = %@",sortArray);
        
        
    }
    return 0;
}
