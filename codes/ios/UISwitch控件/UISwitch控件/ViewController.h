//
//  ViewController.h
//  UISwitch控件
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    // 所有的UIKit框架库 中的控件均已UI开头，苹果的UI控件都在UIKit中
    //定义一个开关控件，有两种状态 开和关
    UISwitch *_mySwitch;
}

/*
 retain 修饰除了 基本数据类型 和 字符串 之外的数据类型
 作用：引用计数
 assign 没有引用计数 它用来修饰 基本数据类型
 copy:修饰字符串
 
*/
@property(nonatomic,retain)UISwitch * mySwitch;

@end

