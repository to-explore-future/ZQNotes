//
//  LandScape.h
//  横屏测试
//
//  Created by sharingmobile on 2018/3/9.
//  Copyright © 2018年 zq. All rights reserved.
//

#import <UIKit/UIKit.h>

// 横竖屏动画执行完的回调.
typedef void(^BLScreenEventsComplete)(void);
// 横竖屏动画执行的回调.
typedef void(^BLScreenEventsAnimations)(void);

@interface LandScape : UIView

typedef NS_ENUM(NSInteger, BLLandscapeViewStatus) {
    BLLandscapeViewStatusPortrait = 0,
    BLLandscapeViewStatusLandscape,
    BLLandscapeViewStatusAnimating
};

/**
 * 横竖屏状态.
 */
@property(nonatomic, readonly) BLLandscapeViewStatus viewStatus;

/**
 * 横屏.
 * @watchout : 当前界面会被添加到窗口 Window 上.
 *
 * @param animated   是否需要动画.
 * @param animations 横屏动画执行过程中需要额外添加的动画代码.
 * @param complete   横屏动画执行完的回调.
 */
- (void)bl_landscapeAnimated:(BOOL)animated animations:(BLScreenEventsAnimations)animations complete:(BLScreenEventsComplete)complete;

/**
 * 竖屏.
 *
 * @param animated   是否需要动画.
 * @param animations 竖屏动画执行过程中需要额外添加的动画代码.
 * @param complete   竖屏动画执行完的回调.
 */
- (void)bl_protraitAnimated:(BOOL)animated animations:(BLScreenEventsAnimations)animations complete:(BLScreenEventsComplete)complete;

@end
