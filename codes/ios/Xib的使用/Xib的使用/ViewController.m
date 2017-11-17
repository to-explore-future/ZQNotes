//
//  ViewController.m
//  Xib的使用
//
//  Created by to-explore-future on 17/11/13.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "AppsView.h"
#import "App.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil];
    NSArray * array = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"count = %ld",array.count );
    
    NSInteger screenWidth   = [UIScreen mainScreen].bounds.size.width;
    NSInteger sideWidth     = 30;       //左右侧边宽度
    NSInteger sideHeight    = 50;       //上下侧边高度
    NSInteger lineNumber    = 3;
    NSInteger width         = 80;       //控件的宽度
    NSInteger height        = 100;      //控件的高度
    NSInteger spaceBetweenHorizontal = (screenWidth - sideWidth*2 -width*lineNumber )/ (lineNumber - 1);
    NSInteger spaceBetweenVertical = 30;
    
    NSInteger count = array.count;
    for (NSInteger i = 0; i < count; i++) {
//        App * model = array[i];
//        NSLog(@"mode.icon = %@,mode.name = %@",model.icon,model.name);
        AppsView *apps = [[[NSBundle mainBundle] loadNibNamed:@"AppsView" owner:nil options:nil] lastObject];
        
        //375 677
        NSInteger x = sideWidth + (i % lineNumber)*(width+spaceBetweenHorizontal);
        NSInteger y = sideHeight + (i / lineNumber)* (height + spaceBetweenVertical);
        apps.frame = CGRectMake(x, y, width, height);
        
        //赋值
        App * model = [[App alloc] initWithDict:array[i]];
        apps.model = model;
        
        
        
        [self.view addSubview:apps];
        
    }
    
    
    
}



@end
