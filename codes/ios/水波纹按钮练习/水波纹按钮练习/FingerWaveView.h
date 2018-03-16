//
//  FingerWaveView.h
//  水波纹按钮练习
//
//  Created by sharingmobile on 2018/3/7.
//  Copyright © 2018年 zq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FingerWaveView : UIView

+ (instancetype)showInView:(UIView *)view center:(CGPoint)center;

-(void)removeAllSubLayter;

@end
