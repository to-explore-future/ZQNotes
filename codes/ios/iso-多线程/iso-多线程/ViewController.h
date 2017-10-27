//
//  ViewController.h
//  iso-多线程
//
//  Created by to-explore-future on 17/10/27.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSThread    *_t1    ;
    NSThread    *_t2    ;
    NSLock      *_lock  ;
    NSInteger    _count ;
}


@end

