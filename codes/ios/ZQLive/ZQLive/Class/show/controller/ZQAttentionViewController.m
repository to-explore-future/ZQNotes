//
//  ZQAttentionViewController.m
//  ZQLive
//
//  Created by to-explore-future on 17/11/6.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQAttentionViewController.h"

@interface ZQAttentionViewController ()

@end

@implementation ZQAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor orangeColor];
    UILabel * lable = [[UILabel alloc ]initWithFrame:CGRectMake(100, 100, 100, 100)];
    lable.textColor = [UIColor purpleColor];
    lable.backgroundColor = [UIColor yellowColor    ];
    lable.text = @"关注"    ;
    [self.view addSubview:lable];
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

@end
