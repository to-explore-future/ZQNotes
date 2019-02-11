//
//  MasonryTestVC.m
//  IOS_practice
//
//  Created by haoqiao on 2019/2/2.
//  Copyright © 2019 zq. All rights reserved.
//

#import "MasonryTestVC.h"

@interface MasonryTestVC ()

@end

@implementation MasonryTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData{
    self.title = @"Masonry 的使用";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initView{
    UIView * view = [[UIView alloc] init];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor greenColor];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.top.mas_equalTo(self.view.mas_top).offset(150);
//        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-300);
        make.height.mas_equalTo(100);
    }];
    
    
    
}

@end
