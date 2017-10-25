//
//  Vc1.m
//  页面跳转
//
//  Created by to-explore-future on 17/10/25.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "Vc1.h"
#import "Vc2.h"

@interface Vc1 ()

@end

@implementation Vc1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"Vc...";
    self.navigationItem.title = @"Vc1";
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void) next{
    Vc2 * v2 = [[Vc2 alloc] init];
    [self.navigationController pushViewController:v2  animated:YES];
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
