//
//  Dog+print.m
//  选择器类别类扩展
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "Dog+print.h"
//想给Dog添加一个方法(print)，
@implementation Dog (print)

- (void)print{
    NSLog(@"dog'name = %@",_name);
    //这样就给Dog类添加了一个方法，
    //如果你接手别人的项目 可以使用这种方法
}
@end
