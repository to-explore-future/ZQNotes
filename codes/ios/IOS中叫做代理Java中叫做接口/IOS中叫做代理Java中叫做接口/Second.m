//
//  Second.m
//  IOS中叫做代理Java中叫做接口
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "Second.h"

@interface Second ()

@end

@implementation Second

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第二个页面";
    [_delegete changeColor:[UIColor purpleColor]];
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
