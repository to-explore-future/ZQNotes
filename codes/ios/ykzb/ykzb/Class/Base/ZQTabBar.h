//
//  ZQTabBar.h
//  ykzb
//
//  Created by to-explore-future on 17/11/3.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQTabBar;

//枚举的定义方式
typedef NS_ENUM(NSUInteger,ZQTabBarButtonType) {
    ZQTabBarButtonTypeLive = 100,   //展示直播
    ZQTabBarButtonTypeMe            //我的
};



/**
 *  A delegate is way of messaging
 */
@protocol ZQTabBarDelegate <NSObject>

//定义规则 ：去掉前缀 小写
//clickbutton这里 给一个 NSUInteger 使用起来 就不知道 到底表示什么意思
//一定要起一个有意义的 标识符 可以使用枚举
-(void)tabbar:(ZQTabBar *)tabbar clickButton:(NSUInteger)idx;

@end


/**
 *  A block is another way of messaging
 *  the style of block
 */
typedef void(^TabBlock)(ZQTabBar *tabbar,NSUInteger idx);



@interface ZQTabBar : UIView

//代理使用weak修饰
@property(nonatomic,weak)id<ZQTabBarDelegate> delegate;

//注意block的修饰方式。使用copy
@property(nonatomic,copy) TabBlock block;

@end
