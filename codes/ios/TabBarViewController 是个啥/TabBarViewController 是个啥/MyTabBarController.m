//
//  MyTabBarController.m
//  TabBarViewController 是个啥
//
//  Created by to-explore-future on 17/12/1.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "MyTabBarController.h"
#import "RedViewController.h"
#import "BlueViewController.h"
#import "GreenViewController.h"
#import "PurpleViewController.h"
#import "YellowViewController.h"

@interface MyTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
//    self.view.backgroundColor = [UIColor purpleColor];
    [self createControllers];
}

-(void)createControllers{
    RedViewController       * red       = [[RedViewController alloc]init];
    BlueViewController      * blue      = [[BlueViewController alloc] init];
    YellowViewController    * yellow    = [[YellowViewController alloc]init];
    PurpleViewController    * purple    = [[PurpleViewController alloc] init];
    GreenViewController     * green     = [[GreenViewController alloc] init];
    
    NSMutableArray * vcArray = [NSMutableArray arrayWithObjects:red,blue,yellow,purple,green, nil];
    NSArray * titles = @[@"首页",@"客服",@"订单",@"收藏",@"我的"];
    NSArray * normal= @[@"home_normal@2x",@"kefu_normal@2x",@"order_normal@2x",@"collection_normal@2x",@"user_normal@2x"];
    NSArray * hightLighted = @[@"home_hightlight@2x",@"kefu_hightlight@2x",@"order_hightlight@2x",@"collection_hightlight@2x",@"user_hightlight@2x"];
    NSInteger count = vcArray.count;
    for (int i = 0 ; i < count; i++) {
        UIViewController * vc = vcArray[i];
        vc.title = titles[i];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [vcArray replaceObjectAtIndex:i withObject:nav];
        UIImage * normalImage = [UIImage imageNamed:normal[i]];
        UIImage * selectImage = [UIImage imageNamed:hightLighted[i]];
        nav.tabBarItem.image = normalImage;
        nav.tabBarItem.selectedImage = selectImage;
    }
    
    self.viewControllers = vcArray;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
