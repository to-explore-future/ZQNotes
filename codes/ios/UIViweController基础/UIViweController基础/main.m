//
//  main.m
//  UIViweController基础
//
//  Created by to-explore-future on 17/10/20.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//整个app程序的主函数，入口函数
int main(int argc, char * argv[]) {
    // 自动内存释放池
    @autoreleasepool {
        // UIKit 框架结构的启动函数
        // argc:启动是带有参数的个数
        // argv:参数列表
        // nil :要求传入一个主框架类类名，如果参数为 nil 系统会自动使用默认的框架类作为框架类类名
        //     :主框架的代理类对象，
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
