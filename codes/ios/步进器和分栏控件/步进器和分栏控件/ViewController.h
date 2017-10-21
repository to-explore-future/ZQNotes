//
//  ViewController.h
//  步进器和分栏控件
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    // 自定步进器 ：一次移动一个单位，比如：视频一次快进5秒，音量一次增加5%
    UIStepper * _stepper;
    
    
    //分栏器
    UISegmentedControl* _segControl;
}

@property(nonatomic,retain)UIStepper * stepper;
@property(nonatomic,retain)UISegmentedControl * segmentControl;
@end

