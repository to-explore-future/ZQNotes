//
//  main.m
//  RunTimeTest
//
//  Created by sharingmobile on 2018/4/28.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //归档解档 练习
        //1.变成文件  NSHomeDirectory() 就是沙盒目录
        NSArray *array = [NSArray arrayWithObjects:@"zhang",@"wangwu",@"lisi",nil];
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/array.src"];
        BOOL isSuccess = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
        
        NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
        
        NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
        
        NSString *cacheDirectoryPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
        
        NSString *preferencePanesPath = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES).lastObject;
        
        NSString *temporaryPath = NSTemporaryDirectory();
        
        if (isSuccess) {
            NSLog(@"归档成功");
        }else{
            NSLog(@"归档失败");
        }
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
