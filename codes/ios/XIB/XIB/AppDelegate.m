//
//  AppDelegate.m
//  XIB
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "AppDelegate.h"
#import "vcRoot.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    正常情况下 系统会自动 走 info.plist 中定义的 mainboard 。。。 删除之后 就需要 告诉系统
    要加载的 东西 
    把自己定义的 UIViewController 赋值给 self.window.rootViewController
     系统就会 加载自己定义的
     其实系统默认去找 self.window.rootViewController 所指向的对象
     */
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    /*
     解释一下bundle ：生成app的时候 系统会把所有的资源都打包，其中源代码会变成二进制，放在一起，而一些资源文件会放到
     一个叫做 bundle 的资源目录中。下面的代码就是告诉 执行这个app 的手机 去mainBoundle这个资源目录中去找 vcRoot
     如果 不写这个目录 系统也会自动去mainBundle 中去找，这个是默认的目录。
     */
    vcRoot * root = [[vcRoot alloc] initWithNibName:@"vcRoot" bundle:[NSBundle mainBundle]];
    /*
        即使是 使用这中方式初始化 ，也是可以的 只要系统中有这个 vcRoot 这个类 就可以系统会默认到 mainBundle去找
     如果找不到 系统会使用默认的 一个黑色 作为启动页面。
     */
//    vcRoot * root = [[vcRoot alloc ] init];
    self.window.rootViewController = root;
    
    [self.window makeKeyAndVisible];
    
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
