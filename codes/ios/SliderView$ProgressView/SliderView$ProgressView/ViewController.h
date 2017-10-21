//
//  ViewController.h
//  SliderView$ProgressView
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    //进度条 用来展示一般 不能调整，被动的
    UIProgressView * _progressView;
    //用来给用户 调整用的 主动的
    UISlider * _slider;
}

// 声明构造方法
@property(nonatomic,retain)UIProgressView *pView;
@property(nonatomic,retain)UISlider * slider;

@end

