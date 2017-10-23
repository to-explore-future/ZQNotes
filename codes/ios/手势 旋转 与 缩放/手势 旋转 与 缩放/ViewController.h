//
//  ViewController.h
//  手势 旋转 与 缩放
//
//  Created by to-explore-future on 17/10/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    UIPinchGestureRecognizer *_pinchGR;
    UIRotationGestureRecognizer * _rotationGR;
}


@end

