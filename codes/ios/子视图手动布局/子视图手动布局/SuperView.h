//
//  SuperView.h
//  子视图手动布局
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperView : UIView{
    UIView* _mView01;
    UIView* _mView02;
    UIView* _mView03;
    UIView* _mView04;
}

- (void)initViews;

@end
