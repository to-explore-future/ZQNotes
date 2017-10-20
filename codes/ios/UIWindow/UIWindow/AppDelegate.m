//
//  AppDelegate.m
//  UIWindow
//
//  Created by to-explore-future on 17/10/20.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 程序的入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // 整个程序中只有一个也是继承与 UIView ，是一个特殊的UIView
    // UIScreen ：表示手机的屏幕，可以获得
    // mainScreen 获得主屏幕的设备信息
    // bounds ：屏幕的宽高值
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //初始化一个跟视图控制器，，作为UIWindow的视图控制器
    self.window.rootViewController = [[UIViewController alloc] init];
    //设置背景颜色
    self.window.backgroundColor = [UIColor orangeColor];
    //使 window有效并且显示到 屏幕上
    [self.window makeKeyAndVisible ];
    
    
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 400)];
    backView.backgroundColor = [UIColor blueColor];
    [self.window addSubview:backView];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    view.backgroundColor = [UIColor yellowColor];
    [backView addSubview:view];
    
    //一个window下的所有的控件的都持有这个window的引用
    NSLog(@"window = %@",self.window);
    NSLog(@"window = %@",view.window);
    NSLog(@"window = %@",backView.window);
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
