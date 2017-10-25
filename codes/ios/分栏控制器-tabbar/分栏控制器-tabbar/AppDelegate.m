//
//  AppDelegate.m
//  分栏控制器-tabbar
//
//  Created by to-explore-future on 17/10/25.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "AppDelegate.h"
#import "vc1.h"
#import "vc2.h"
#import "vc3.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen ].bounds];
    [self.window makeKeyAndVisible];
    
    UITabBarController * tab = [[UITabBarController alloc] init];
    
    vc1 *v1 = [[vc1 alloc] init];
    vc2 *v2 = [[vc2 alloc] init];
    vc3 *v3 = [[vc3 alloc] init];
    
    /*
     为什么要在这里初始化 标题呢，因为系统不会有限加载 VC1 vc2 vc3 ，只有在用他们的时候才会加载里面的代码，默认加载一个，其余不加载，
     */
//    v1.title = @"first";
//    v2.title = @"second";
//    v3.title = @"third";
    UITabBarItem * tab1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:106];
    tab1.badgeValue = @"最近";
    tab1.badgeColor = [UIColor orangeColor];
    
    UITabBarItem * tab2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:109];
    tab2.badgeValue = @"联系人";
    tab2.badgeColor = [UIColor greenColor];
    
    UITabBarItem * tab3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:108];
    tab3.badgeValue = @"特色";
    tab3.badgeColor = [UIColor blueColor];
    
    v1.tabBarItem = tab1;
    v2.tabBarItem = tab2;
    v3.tabBarItem = tab3;
        
    NSArray * array = [[NSArray alloc] initWithObjects:v1,v2,v3, nil];
    
    tab.viewControllers = array;
    
    
    self.window.rootViewController = tab;
    
    
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
