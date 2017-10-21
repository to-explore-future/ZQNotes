//
//  ViewController.m
//  TextField
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField = _textField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // 有的时候类的名称的写错了 好多代码就不提示了，有的时候好多 代码不提示了 说明 可能类的名称写错了
    self.textField = [[UITextField alloc]   init];
    self.textField.frame = CGRectMake(50, 100, 200, 30);
//    self.textField.text = @"用户名";
    self.textField.font = [UIFont systemFontOfSize:15];
    self.textField.textColor = [UIColor orangeColor];
    /*
     边框风格
     UITextBorderStyleNone,
     UITextBorderStyleLine,
     UITextBorderStyleBezel,
     UITextBorderStyleRoundedRect
     */
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    /*
     输入板风格一大堆
     UIKeyboardTypePhonePad
     UIKeyboardTypeDefault
     UIKeyboardTypeASCIICapable
     UIKeyboardTypeNumbersAndPunctuation
     UIKeyboardTypeURL
     UIKeyboardTypeNumberPad
     UIKeyboardTypePhonePad
     UIKeyboardTypeNamePhonePad
     UIKeyboardTypeEmailAddress
     UIKeyboardTypeDecimalPad
     UIKeyboardTypeTwitter
     UIKeyboardTypeWebSearch
     UIKeyboardTypeASCIICapableNumberPad
     UIKeyboardTypeAlphabet
     */
    self.textField.keyboardType = UIKeyboardTypeDefault;
    
    self.textField.placeholder = @"请输入用户名";
    //安全的文字
    self.textField.secureTextEntry = YES;
    [self.view addSubview:self.textField];
    
//    [self.textField setDelegate:self];
    self.textField.delegate = self;
}

//是否可以进行输入，如果为yes 可以  No 不可以输入
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //不弹出输入框
    return YES;
}

//是否可以结束输入，可以键盘回收-->
//比如有的时候 要求了输入长度：如果长度不够 就不能结束输入
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
   NSLog(@"开始编辑");
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"结束编辑");
}



//点击屏幕空白位置时
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //使虚拟键盘收回去，不在作为第一消息响应
    [self.textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
