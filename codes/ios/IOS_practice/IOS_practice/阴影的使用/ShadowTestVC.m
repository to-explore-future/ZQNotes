//
//  ShadowTestVC.m
//  IOS_practice
//
//  Created by haoqiao on 2019/2/2.
//  Copyright © 2019 zq. All rights reserved.
//

#import "ShadowTestVC.h"

@interface ShadowTestVC ()

@end

@implementation ShadowTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData{
    self.title = @"Shadow 的使用";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initView{

    //第一中方式 使用 NSShadow 这个类
    UITextField * textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.top.mas_equalTo(self.view.mas_top).offset(120);
        make.height.mas_equalTo(40);
    }];
    
    //...

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
