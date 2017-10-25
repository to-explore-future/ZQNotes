//
//  vc1.m
//  分栏控制器-tabbar
//
//  Created by to-explore-future on 17/10/25.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "vc1.h"

@interface vc1 ()

@end

@implementation vc1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"first";
    
//    UITabBarItem * tabBarItem = [[UITabBarItem alloc] initWithTitle:@"456" image:nil tag:102];
//    self.tabBarItem = tabBarItem;
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
