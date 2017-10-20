//
//  main.m
//  字符串操作
//
//  Created by to-explore-future on 17/10/17.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 大小写 转换
        
        // uppercaseString 转大写
        NSString *str1 = @"Hello world";
        NSLog(@"变大写 str = %@",[str1 uppercaseString]);
        
        //大写 -> 小写
        NSString *str2 = @"WELCOM TO CHINA";
        NSLog(@"变小写 str = %@",[str2 lowercaseString]);
        
        //把单词的首字母转换成大写其余字母转换成小写
        NSString *str3 = @"WELCOM TO CHINA";
        NSLog(@"首字母大写 其余字母小写 str = %@",[str3 capitalizedString]);
        
        //字符串数值转换
        //数字字符是 0~9 多的部分不转化
        NSString * str4 = @"123abc";
        NSLog(@"num = %i",[str4 intValue]);
        
        //把字符串对象 转换成 NSInteger 类型
        NSLog(@"num = %li",[@"9876564" integerValue]);
        //把字符串转换成浮点类型的数据
        NSLog(@"value = %.2f",[@"78.35" floatValue]);
        
        // 字符串的置换
        NSString * str5 = @"hello world hello china";
        NSRange str5Range = {0 ,23};
        NSString *result = [str5 stringByReplacingCharactersInRange:str5Range withString:@"w"];
        NSLog(@"result = %@",result);
        
        //替换在原字符串中所有出现的目标字符串
        NSString * newStr5 = [str5 stringByReplacingOccurrencesOfString:@"hello" withString:@"你好"];
        NSLog(@"occurrences = %@",newStr5);
        
        //
        NSString *str8 = [str5 stringByReplacingOccurrencesOfString:@"hello" withString:@"你好" options:NSLiteralSearch range:NSMakeRange(0, 10)];
        NSLog(@"str8 = %@",str8);
        
        
        // 文件的输入输出:读取文件的内容为字符串对象:initWithContentsOfFile
        NSError *error = nil;
        NSString *filePaht = @"/Users/sunbin/zq/git/LearningNotes/codes/Object-C/字符串操作/字符串操作/file.txt";
        NSString *str9 =  [[NSString alloc] initWithContentsOfFile:filePaht encoding:NSUTF8StringEncoding error:&error];
        if(error){
            NSLog(@"error = %@",error);
        }else{
            NSLog(@"str9 = %@",str9);
        }
        
        //对应的有一个类方法
        // stringWithContentsOfFile
        
        
        //写入文件
        //
        NSString *str10 = @"中国人";
        BOOL b = [str10 writeToFile:filePaht atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if(b){
            NSLog(@"写入成功");
        }else{
            NSLog(@"写入失败") ;
        }
        
    }
    return 0;
}
