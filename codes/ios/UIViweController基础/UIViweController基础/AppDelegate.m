//
//  AppDelegate.m
//  UIViweController基础
//
//  Created by to-explore-future on 17/10/20.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //得到一个手机屏幕大小的window:mainScreen 拿到了硬件屏幕的信息，里面的bounds 属性及时 屏幕的宽高
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //初始化 根视图控制器，整个UiKit框架中只有一个 根视图控制器
    UIViewController *vcRoot = [[UIViewController alloc  ] init];
    //程序启动之前 这个控制必须赋值 否则程序崩溃
    self.window.rootViewController = vcRoot;
    
    //将window作为主视图 并且显示出来
    [self.window makeKeyAndVisible  ];
    
    self.window.backgroundColor = [UIColor orangeColor];
    
    
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
