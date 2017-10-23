//
//  ViewController.h
//  手势判断移动图片
//
//  Created by to-explore-future on 17/10/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    CGPoint _OldPoint;
    CGPoint _ImagePoint;
    CGPoint _reletivePoint;
    
    CGPoint _touchPoint;
    CGPoint _unTouchPoint;
    CGFloat _distanceX;
    CGFloat _distanceY;
}
/*
 类的继承关系  UIViewController extends UIResponder
 UIResponder 四个方法
 - (void)touchesBegan:
 - (void)touchesMoved:
 - (void)touchesEnded:
 - (void)touchesCancelled:
*/

@end

