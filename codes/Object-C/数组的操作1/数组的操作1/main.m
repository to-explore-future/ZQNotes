//
//  main.m
//  数组的操作1
//
//  Created by to-explore-future on 17/10/18.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //像数组中添加元素
        
        //一次添加一个元素
        NSArray *array1  = [NSArray arrayWithObjects:@"onw",@"two", nil];
        array1  = [array1 arrayByAddingObject:@"three"];
        NSLog(@"array1 = %@",array1);
        
        //一次添加一个 数组
        array1 = [array1 arrayByAddingObjectsFromArray:@[@"four",@"five"]];
        NSLog(@"array1 = %@",array1);
        
        
        //数组的提取:提取出一个范围的元素，生成一个新的数组,range 左闭右开
        NSArray *subArray = [array1 subarrayWithRange:NSMakeRange(0, 3)];
        NSLog(@"subArray = %@",subArray);
        
        
        //提取指定 下标的元素 然后形成新的数组
        NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSetWithIndex:0];
        [indexSet addIndex:2];
        [indexSet addIndex:4];
        NSArray *subArray2 = [array1 objectsAtIndexes:indexSet];
        NSLog(@"subArray2 = %@",subArray2);
        
        //字符串的分割
        NSString *str = @"I,,am,a,good,boy";
        //这个方法有问题,如果是多个连续的符合的位置，生成的数组中就会包含“”，
        //可以在生成的数组中再，去除一次“”
        NSArray * array2 = [str componentsSeparatedByString:@","];
        NSLog(@"array2 = %@",array2);
        
        //以字符集进行分割
        NSArray * array3 = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@",,"]];
        NSLog(@"array3 = %@",array3);
        
        //数组元素的拼接
        NSArray *array5 = [NSArray arrayWithObjects:@"one",@"two",@"three", nil];
        NSString *str5 = [array5 componentsJoinedByString:@","];
        NSLog(@"str5 = %@",str5);
        
        //数组的遍历
        NSArray * company = @[@"华为",@"小米",@"Google",@"微软",@"腾讯",@"阿里巴巴"];
        //通过数组元素的下标 遍历数组
        NSInteger cnt = [company count];
        for (int i = 0; i < cnt; i++) {
           NSLog(@"%@",[company objectAtIndex:i]);
        }
        
        //方法二：枚举法
        
        //倒叙
        NSEnumerator *reverseEnumerator = [company reverseObjectEnumerator];
        id obj = nil;
        while(obj = [reverseEnumerator nextObject]){
            NSLog(@"reverse obj = %@",obj);
        }
        
        //正序
        NSEnumerator * enumerator = [company objectEnumerator];
        id obj2 = nil;
        while(obj2 = [enumerator nextObject]){
           NSLog(@"reverse obj2 = %@",obj2);
        }
        
        //方法三：快速枚举
        for (id obj3 in company) {
            NSLog(@"reverse obj3 = %@",obj3);
        }
        
        
        
    }
    return 0;
}
