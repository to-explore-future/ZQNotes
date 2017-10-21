//
//  ViewController.m
//  用户登陆界面
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _labelUserName = [[UILabel alloc] init];
    _labelUserName.frame = CGRectMake(50, 50, 50, 30);
    _labelUserName.text = @"用户名";
    _labelUserName.font = [UIFont systemFontOfSize:15];
    _labelUserName.textAlignment = NSTextAlignmentLeft;
    
    _labelPassWord = [[UILabel alloc] init];
    _labelPassWord.frame = CGRectMake(50, 100, 50, 30);
    _labelPassWord.text = @"密码";
    _labelPassWord.font = [UIFont systemFontOfSize:15];
    _labelPassWord.textAlignment = NSTextAlignmentLeft;
    
    _tfUserName = [[UITextField alloc] init];
    _tfUserName.frame = CGRectMake(100, 50, 150, 30);
    _tfUserName.borderStyle = UITextBorderStyleRoundedRect;
    _tfUserName.keyboardType = UIKeyboardTypeDefault;
    _tfUserName.secureTextEntry = NO;
    _tfUserName.placeholder = @"输入用户名";
    _tfUserName.font = [UIFont systemFontOfSize:15];
    _tfUserName.textColor = [UIColor orangeColor];
    
    _tfPassWord = [[UITextField alloc] init];
    _tfPassWord.frame = CGRectMake(100, 100, 150, 30);
    _tfPassWord.borderStyle = UITextBorderStyleRoundedRect;
    _tfPassWord.keyboardType = UIKeyboardTypeDefault;
    _tfPassWord.secureTextEntry = YES;
    _tfPassWord.placeholder = @"输入密码";
    _tfPassWord.font = [UIFont systemFontOfSize:15];
    _tfPassWord.textColor = [UIColor orangeColor];
    
    
    _btlogin = [[UIButton alloc] init];
    _btlogin.frame = CGRectMake(180, 150, 100, 30);
    [_btlogin setTitle:@"登陆" forState:UIControlStateNormal];
    [_btlogin setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_btlogin addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    _btregist = [[UIButton alloc] init];
    _btregist.frame = CGRectMake(20, 150, 100, 30);
    [_btregist setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_btregist setTitle:@"注册" forState:UIControlStateNormal];
    [_btregist addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_tfUserName];
    [self.view addSubview:_tfPassWord];
    [self.view addSubview:_labelUserName];
    [self.view addSubview:_labelPassWord];
    [self.view addSubview:_btlogin];
    [self.view addSubview:_btregist];
    
}

- (void)login{
    if([_tfUserName.text isEqualToString:@"zq"] && [_tfPassWord.text isEqualToString:@"123"]){
        //打开下一个界面
    }else{
        //
        UIAlertView * alerView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"cuowo" delegate:nil cancelButtonTitle:@"quxiao" otherButtonTitles:@"ok", nil];
        [alerView show];
        
    }
}

- (void)regist{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_tfUserName resignFirstResponder];
    [_tfPassWord resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
