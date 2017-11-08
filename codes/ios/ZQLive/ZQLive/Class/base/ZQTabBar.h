//
//  ZQTabBar.h
//  ZQLive
//
//  Created by to-explore-future on 17/11/3.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQTabBar;

typedef NS_ENUM(NSUInteger,ZQButtonItemType) {
    ZQButtonItemLaunch = 10,    //
    ZQButtonItemLive  = 100,    //live
    ZQButtonItemMe              //枚举默认自增 me
};

/**
 *  定义协议
 */
@protocol ZQTabBarDelegate <NSObject>

//这里想要通过一个id 来区分点击的到底是哪个button，但是这样真的好吗，
//可读性怎么样，不如使用 枚举更加明确
- (void)tabbar:(ZQTabBar * )tabbar clickButton:(NSUInteger) idx;

@end

/**
 *  define block
 */
typedef void(^TabBlock)(ZQTabBar * tabbar,ZQButtonItemType idx);



@interface ZQTabBar : UIView

//代理使用weak修饰， id加泛型 来表示
@property(nonatomic,weak) id<ZQTabBarDelegate>  delegate;
@property(nonatomic,copy) TabBlock block;

@end
