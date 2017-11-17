//
//  ViewController.m
//  加法计算器
//
//  Created by to-explore-future on 17/11/11.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num1;
@property (weak, nonatomic) IBOutlet UITextField *num2;
@property (weak, nonatomic) IBOutlet UILabel *result;

- (IBAction)compute;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)compute {
    int a = [_num1.text intValue];
    int b = [_num2.text intValue];
    int result = a + b;
    _result.text = [NSString stringWithFormat:@"%d",result];
    
//    [self hiddenKeyBoard];
    //
    [self.view endEditing:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hiddenKeyBoard];
}

- (void)hiddenKeyBoard{
    //叫回键盘
//    [self.num1 resignFirstResponder];
//    [self.num2 resignFirstResponder];
    
    [self.view endEditing:YES];
}
@end
