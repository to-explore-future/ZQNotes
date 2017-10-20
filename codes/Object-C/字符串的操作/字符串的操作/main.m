//
//  main.m
//  字符串的操作
//
//  Created by to-explore-future on 17/10/17.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * ns1 = [[NSString alloc] initWithCString:"我是中国人" encoding:NSUTF8StringEncoding];
        NSString * ns2 = [[NSString alloc] initWithFormat:@"%@-%d-%@",@"我是",55,@"中国人"];
        
        // compare 方法  三个枚举
        // NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
        NSComparisonResult res = [ns1 compare:ns2];
        if(res == NSOrderedAscending){
            NSLog(@"%@ 大于 %@",ns1,ns2);
        }else if(res == NSOrderedSame){
            NSLog(@"%@ 等于 %@",ns1,ns2);
        }else{
            NSLog(@"%@ 小于 %@",ns1,ns2);
        }
        
        // isEqualToString
        
        BOOL result = [ns1 isEqualToString:ns2];
        if(result == YES){
            NSLog(@"%@ 和 %@ 相等",ns1,ns2);
        }else{
            NSLog(@"%@ 和 %@ 不相等",ns1,ns2);

        }
        
        // 是否以 XXX字符串开头
        NSString *baidu = @"www.baidu.com";
        NSString *prefix = @"www";
        BOOL rs = [baidu hasPrefix:prefix];
        if(rs == YES){
            NSLog(@"%@ 包含 %@",baidu,prefix);
        }else{
            NSLog(@"%@ 不包含 %@",baidu,prefix);
        }
        
        //是否以 XXX字符串结尾
        NSString *suffix = @".com";
        BOOL hasSuffix = [baidu hasSuffix:suffix];
        if(hasSuffix == YES){
            NSLog(@"%@ 包含 %@",baidu,suffix);
        }else{
            NSLog(@"%@ 不包含 %@",baidu,suffix);
        }
        
        
        //字符串的追加
        // NSString 是一个常量 ，追加 只是表象 实质是 创建了一个新的字符串常量
        NSString * newBaidu = [baidu stringByAppendingString:@"\\zq\\0023.jpg"];
        NSLog(@"%@",newBaidu);
        
        //格式化追加字符串
        NSString * newFormatBaidu =  [baidu stringByAppendingFormat:@"%@%@",@"\\zq\\0023",@".jpg"];
        NSLog(@"%@",newFormatBaidu);
        
        // 字符串的提取
        
        // 左闭右开
        //从哪里开始
        NSLog(@"sub-from-baidu = %@",[baidu substringFromIndex:4]);
        // 到哪里结束
        NSLog(@"sub-to-baidu = %@",[baidu substringToIndex:4]);
        
        /*
         * typedef struct _NSRange {
         *     NSUInteger location;
         *     NSUInteger length;
         * } NSRange;
         */
        NSRange ns = {4,5};
        NSLog(@"sub-baidu-by-range = %@",[baidu substringWithRange:ns]);
        //第二种方式
        NSLog(@"sub-baidu-by-range = %@",[baidu substringWithRange:NSMakeRange(4, 5)]);
        
        
        //字符串的查找
        
        // 子字符串在原字符串中的位置
        NSString * sonStr = @"www";
        NSRange sonRange = [baidu rangeOfString:sonStr];
        if(sonRange.location == NSNotFound){//NSNotFound 是long类型的最大值
            NSLog(@"%@不包含%@,NSNotFound = %li",baidu,sonStr,NSNotFound);
        }else{
            NSLog(@"%@包含%@,从%li角标开始,长度为%li",baidu,sonStr,sonRange.location,sonRange.length);
        }
        
        //倒叙查找
        NSRange backwardSearch = [baidu rangeOfString:sonStr options:NSBackwardsSearch];
        if(backwardSearch.location == NSNotFound){//NSNotFound 是long类型的最大值
            NSLog(@"%@不包含%@,NSNotFound = %li",baidu,sonStr,NSNotFound);
        }else{
            NSLog(@"%@包含%@,从%li角标开始,长度为%li",baidu,sonStr,backwardSearch.location,backwardSearch.length);
        }
        
        //从某个范围开始 正序 查找:
        NSRange rangeBack = {0,sizeof(baidu)};
        NSRange backSearchByRange = [baidu rangeOfString:sonStr options:NSLiteralSearch range:rangeBack];
        if(backSearchByRange.location == NSNotFound){//NSNotFound 是long类型的最大值
            NSLog(@"%@不包含%@,NSNotFound = %li",baidu,sonStr,NSNotFound);
        }else{
            NSLog(@"%@包含%@,从%li角标开始,长度为%li",baidu,sonStr,backSearchByRange.location,backSearchByRange.length);
        }
  
    }
    return 0;
}
