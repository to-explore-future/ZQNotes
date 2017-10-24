//
//  SuperView.m
//  子视图手动布局
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "SuperView.h"

@implementation SuperView

- (void)initViews{
    _mView01 = [[UIView alloc] init];
    _mView02 = [[UIView alloc] init];
    _mView03 = [[UIView alloc] init];
    _mView04 = [[UIView alloc] init];
    
    _mView01.frame = CGRectMake(0, 0, 40, 40);
    _mView02.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
    _mView03.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    _mView04.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40);
    
    _mView01.backgroundColor = [UIColor orangeColor];
    _mView02.backgroundColor = [UIColor orangeColor];
    _mView03.backgroundColor = [UIColor orangeColor];
    _mView04.backgroundColor = [UIColor orangeColor];
    
    [self addSubview:_mView01];
    [self addSubview:_mView02];
    [self addSubview:_mView03];
    [self addSubview:_mView04];
}

//如果想要子View 跟随者父View 一起变化 就要把子View的位置实现方法 搞到这里面来
/*
 原理：当父View 的尺寸发生改变的时候 ，确定父View 变化后的尺寸后，系统会回调 这个方法
 */
- (void) layoutSubviews{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    _mView01.frame = CGRectMake(0, 0, 40, 40);
    _mView02.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
    _mView03.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    _mView04.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40);
    [UIView commitAnimations];
}

@end
