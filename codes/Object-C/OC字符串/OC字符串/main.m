//
//  main.m
//  OC字符串
//
//  Created by to-explore-future on 17/10/17.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //OC字符串创建的几种方式
        
        //1.utf-8 兼容世界所有的文字
        NSString *ns1 = [[NSString alloc] initWithUTF8String:"欢迎来到未来"];
        NSLog(@"ns1 = %@",ns1);
        
        //2.
        //注意：%s 只是不支持中文
        NSString *ns2 = [[NSString alloc] initWithFormat:@"%s--%d--%@","china",44,@"中国"];
        NSLog(@"ns2 = %@",ns2);
        
        //3.使用字符串对象 构造新的字符串对象
        NSString *ns = @"北京四个火车站";
        NSString *ns4 = [[NSString alloc] initWithString:ns];
        NSLog(@"ns4 = %@",ns4);
        
        //4.
        NSString *NS5 = [[NSString alloc] initWithCString:"我是中国人" encoding:NSUTF8StringEncoding];
        NSLog(@"ns5 = %@",NS5);
        
        
        //NSSTRING 类方法
        
        
        //获取指定下标的 字符
        // 这个unichar是short的别名
        // UniChar 是 unsignd short
//        UniChar 
        unichar ch = [NS5 characterAtIndex:4];
        NSLog(@"字符是 = %C",ch);
    
    }
    return 0;
}
