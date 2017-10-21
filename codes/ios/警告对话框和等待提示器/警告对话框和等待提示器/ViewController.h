//
//  ViewController.h
//  警告对话框和等待提示器
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    UIAlertView * _alertView;
    UIActivityIndicatorView * _indicatorView;
}


@property(nonatomic,retain)UIAlertView * alertView;
@property(nonatomic,retain)UIActivityIndicatorView * indicatorView;

@end

