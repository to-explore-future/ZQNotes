//
//  Dog.m
//  选择器类别类扩展
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "Dog.h"



//类扩展 extension
//写到扩展类 的上面

@interface Dog ()

@property(nonatomic,assign)NSInteger age;

@end

@implementation Dog
- (void)eat{
    NSLog(@"dog like to eat bone");
}
- (void)bark:(NSNumber *)count{
    NSInteger cnt = [count intValue];
    for(int i = 0 ;i < cnt;i++){
        NSLog(@"wang wang wang...");
    }
    
}

-(void)printInformation{
    NSLog(@"name = %@,age = %li",self.name,self.age = 20 );
}
@end




