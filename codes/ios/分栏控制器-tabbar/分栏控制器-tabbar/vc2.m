//
//  vc2.m
//  分栏控制器-tabbar
//
//  Created by to-explore-future on 17/10/25.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "vc2.h"

@interface vc2 ()

@end

@implementation vc2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"second";
    
//    UITabBarItem * tab = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:104];
//    self.tabBarItem = tab;
//    tab.badgeColor = [UIColor orangeColor];
//    tab.badgeValue = @"55";

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
