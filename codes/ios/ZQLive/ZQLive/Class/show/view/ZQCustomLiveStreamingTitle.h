//
//  ZQCustomLiveStreamingTitle.h
//  ZQLive
//
//  Created by to-explore-future on 17/11/6.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQLiveViewController.h"

@protocol ZQCustomLiveStreamingTitleDelegate <NSObject>
//我想点击button的时候 ，把button的tag值 传递给能够控制scrollview 的类就好
//调用这个函数的 对象能够得到一个被点击的button
-(void)button:(UIButton *)button;

@end




@interface ZQCustomLiveStreamingTitle : UIView<ZQLiveViewControllerDelegate>{
    NSInteger buttonWidth;
}

-(instancetype)initWithFrame:(CGRect)frame AndTitleNames:(NSArray *)titleNames;

@property(nonatomic,weak) id<ZQCustomLiveStreamingTitleDelegate> delegate;

@end
