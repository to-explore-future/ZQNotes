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
#import "vc4.h"
#import "vc5.h"
#import "vc6.h"

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
    vc4 *v4 = [[vc4 alloc] init];
    vc5 *v5 = [[vc5 alloc] init];
    vc6 *v6 = [[vc6 alloc] init];
    
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
    
    UITabBarItem * tab4 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:110];
    tab3.badgeValue = @"更多";
//    tab3.badgeColor = [UIColor blueColor];
    
    UITabBarItem * tab5 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:111];
    tab3.badgeValue = @"查找";
//    tab3.badgeColor = [UIColor blueColor];
    
    UITabBarItem * tab6 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:112];
    tab3.badgeValue = @"历史";
//    tab3.badgeColor = [UIColor blueColor];
    
    v1.tabBarItem = tab1;
    v2.tabBarItem = tab2;
    v3.tabBarItem = tab3;
    v4.tabBarItem = tab4;
    v5.tabBarItem = tab5;
    v6.tabBarItem = tab6;
        
    NSArray * array = [[NSArray alloc] initWithObjects:v1,v2,v3,v4,v5,v6, nil];
    
    tab.viewControllers = array;
    
    
    self.window.rootViewController = tab;
    
    tab.delegate = self;
    
    return YES;
}

//选中了一个 tabBarItem
- (void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //至于选中的是哪个 可以通过遍历tabBarController中数组中的元素，与viewController做比较
    
    NSLog(@"选中了一个") ;
}

//即将编辑
- (void) tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    NSLog(@"即将开始编辑");
}

//编辑结束
- (void) tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    if (changed == YES) {
        NSLog(@"顺序发生改变");
    }
    NSLog(@"编辑结束");
}

//即将结束编辑
- (void) tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    NSLog(@"即将结束编辑");
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
