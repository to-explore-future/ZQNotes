//
//  ViewController.m
//  UUIDTest
//
//  Created by sharingmobile on 2018/5/10.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ips" ofType:@"txt"];
    NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray * arrray = [content componentsSeparatedByString:@" "];
    NSString * temp = @"";
    for (NSString * str  in arrray) {
        if ([str containsString:@"."]) {
//            NSLog(@"%@",str);
            
            NSString * aa = [str componentsSeparatedByString:@":"][0];
            aa = [aa stringByAppendingString:@"\n"];
            temp = [temp stringByAppendingString:aa];
        }
    }
    NSLog(@"%@",temp);
    
//    NSLog(@"content = %@",content);
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
