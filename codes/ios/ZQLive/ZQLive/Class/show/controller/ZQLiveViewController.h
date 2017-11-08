//
//  ZQLiveViewController.h
//  ZQLive
//
//  Created by to-explore-future on 17/11/4.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQBaseViewController.h"

@protocol ZQLiveViewControllerDelegate <NSObject>

- (void)scrollViewPageIndex:(NSInteger)pageIndex;

@end


@interface ZQLiveViewController : ZQBaseViewController{
    NSInteger statusBarAndNavigationBarHeight ;
}



@end
