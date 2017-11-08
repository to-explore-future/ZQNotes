//
//  ZQTabBar.m
//  ykzb
//
//  Created by to-explore-future on 17/11/3.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQTabBar.h"



/**
 *  这种写法表示在ZQTabBar的基础上进行扩展
 */
@interface ZQTabBar()

//
@property(nonatomic,strong)UIImageView * tabBgView;

@end


@implementation ZQTabBar

/**
 *  the diffrent of instancetype and id 
 *  他们都可以表示任何一种数据类型，但是 instancetype 只能够使用在 方法的返回值上
 *  不能够想id一样可以使用在参数上面
 *  如果使用instancetype表示返回值类型的话，系统会会提前检测(编译期)这个返回值的类型，
 *  在代码中如果接收的类型和返回的类型不一致，编译期错误就会暴露出来。
 *  但是如果使用id呢，错误就会推迟到运行时期。
 */
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

@end
