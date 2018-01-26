//
//  ViewController.m
//  自定义流式布局
//
//  Created by to-explore-future on 17/12/8.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "MyLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger width = [UIScreen mainScreen].bounds.size.width;
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor lightGrayColor];
    
    MyLayout * cc = [[MyLayout alloc]initWithFrame:CGRectMake(0, 100, width, 500)];
    [cc initData];
//    [cc setLinespace:10];
//    [cc setRowspace:10];
//    [cc setElementPaddinLeft:10];
//    [cc setElementPaddinRight:10];
//    [cc setElementPaddinTop:10];
//    [cc setElementPaddinBottom:10];
    [cc setSelfPadding:10];
    
    cc.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:cc];
    
//    NSArray * citys = @[@"北京",@"上海",@"连云港",@"金水湾",@"保定市",@"哈萨拉",@"艾维克",@"维达",@"上海",@"连云港",@"金水湾",@"保定市",@"哈萨拉",@"艾维克",@"维达",@"上海",@"连云港",@"金水湾",@"保定市",@"哈萨拉",@"艾维克",@"维达",@"上海",@"连云港",@"金水湾",@"保定市",@"哈萨拉",@"艾维克",@"维达",@"上海",@"连云港",@"金水湾",@"保定市",@"哈萨拉",@"艾维克",@"维达",@"上海",@"连云港",@"金水湾",@"保定市",@"哈萨拉",@"艾维克",@"维达",@"维达",@"上海",@"连云港",@"金水湾",@"保定市",@"哈萨拉",@"艾维克",@"维达",@"上海",@"连云港",@"金水湾",@"保定市",@"哈萨拉"];
//    NSArray * citys = @[@"北京",@"上海",@"连云港"];
    NSArray * citys = @[@"1",@"2",@"3"];
    
    [cc setData:citys];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
