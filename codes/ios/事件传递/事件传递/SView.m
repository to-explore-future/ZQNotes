//
//  SView.m
//  事件传递
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "SView.h"

@implementation SView


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"SView 响应");
    [super touchesBegan:touches withEvent:event];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
