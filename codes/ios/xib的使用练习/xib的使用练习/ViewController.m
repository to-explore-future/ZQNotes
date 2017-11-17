//
//  ViewController.m
//  xib的使用练习
//
//  Created by to-explore-future on 17/11/14.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "AppViewItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * filePath =  [[NSBundle mainBundle ] pathForResource:@"apps.plist" ofType:nil] ;
    NSArray * apps = [NSArray arrayWithContentsOfFile:filePath];
//    NSLog(@"count = %ld",apps.count);
    
    
    NSInteger screenWidth   = [UIScreen mainScreen].bounds.size.width;
    NSInteger sideWidth     = 30;       //左右侧边宽度
    NSInteger sideHeight    = 50;       //上下侧边高度
    NSInteger lineNumber    = 3;
    NSInteger width         = 80;       //控件的宽度
    NSInteger height        = 100;      //控件的高度
    NSInteger spaceBetweenHorizontal = (screenWidth - sideWidth*2 -width*lineNumber )/ (lineNumber - 1);
    NSInteger spaceBetweenVertical = 30;
    
    NSInteger count = apps.count;
    for (NSInteger i = 0; i < count;  i++) {
        AppViewItem * appView=  [[[NSBundle mainBundle] loadNibNamed:@"AppViewItem" owner:nil options:nil] lastObject];
        NSDictionary * dict = apps[i];
        AppViewModel * model = [AppViewModel modelWithdict:dict];
        appView.model = model;
        
        NSInteger x = sideWidth + (i % lineNumber)*(width+spaceBetweenHorizontal);
        NSInteger y = sideHeight + (i / lineNumber)* (height + spaceBetweenVertical);
        
        appView.frame = CGRectMake(x, y, width, height);
        
        [self.view addSubview:appView];
    }
    
}


@end
