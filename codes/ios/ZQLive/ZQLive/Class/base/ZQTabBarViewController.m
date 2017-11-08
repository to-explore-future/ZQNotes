//
//  ZQTabBarViewController.m
//  ZQLive
//
//  Created by to-explore-future on 17/11/3.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQTabBarViewController.h"
#import "ZQTabBar.h"
#import "ZQBaseNavigationController.h"
#import "ZQLiveStreamingViewController.h"

@interface ZQTabBarViewController ()<ZQTabBarDelegate>

@property(nonatomic,strong)ZQTabBar * zqTabbar;

@property(nonatomic,strong)UIButton * cameraBtn;

@end

@implementation ZQTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载控制器
    [self configViewControllers];
    //加载tabbar
    [self.tabBar addSubview:self.zqTabbar];

}

-(ZQTabBar *)zqTabbar{
    if (!_zqTabbar) {
        _zqTabbar = [[ZQTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _zqTabbar.delegate = self;
    }
    return _zqTabbar;
}

-(void)configViewControllers{
    //加载 LiveViewController 和 MeViewController
    NSMutableArray * array = [NSMutableArray arrayWithArray:@[@"ZQLiveViewController",@"ZQMeViewController"]];
    NSInteger count = array.count;
    for (NSInteger i = 0 ; i < count; i++) {
        NSString * viewControllerName = array[i];
        UIViewController * viewController = [[NSClassFromString(viewControllerName) alloc] init];
        ZQBaseNavigationController * navc = [[ZQBaseNavigationController alloc] initWithRootViewController:viewController];
        [array replaceObjectAtIndex:i withObject:navc];
    }
    self.viewControllers = array;
}

/**
 *  当按钮被点击的时候 这里被回调
 */
- (void)tabbar:(ZQTabBar *)tabbar clickButton:(NSUInteger)idx{
    if (idx == ZQButtonItemLaunch) {
        ZQLiveStreamingViewController * liveStreaming = [[ZQLiveStreamingViewController alloc] init];
        [self presentViewController:liveStreaming animated:YES completion:nil];
        return ;
    }
    self.selectedIndex = idx - ZQButtonItemLive;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
