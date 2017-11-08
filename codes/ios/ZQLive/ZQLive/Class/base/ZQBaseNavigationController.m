//
//  ZQBaseNavigationController.m
//  ZQLive
//
//  Created by to-explore-future on 17/11/4.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQBaseNavigationController.h"

@interface ZQBaseNavigationController ()

@end

@implementation ZQBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 好好理解一下 这个baseNavigationController是怎么起作用的
    //barTintColor 改变是bar的颜色
    self.navigationBar.barTintColor = RGB(0, 211, 194);
    //tintColor 改变的是 这个bar上的subView的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
