//
//  VCRoot.m
//  XIB手动创建
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_mTFUserName resignFirstResponder];
    [_mTFPassWord resignFirstResponder];
}

- (IBAction)login:(UIButton *)sender {
    NSString *userName = @"aaa";
    NSString *passWord = @"123";
    if ([_mTFUserName.text isEqualToString:userName] && [_mTFPassWord.text isEqualToString:passWord]) {
       UIAlertView *alerView = [ [UIAlertView alloc ] initWithTitle:@"提示" message:@"登录成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alerView show];
    }else{
        UIAlertView *alerView = [ [UIAlertView alloc ] initWithTitle:@"提示" message:@"账号密码不匹配" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alerView show];
    }
}

- (IBAction)recc:(UIButton *)sender {
}
@end
