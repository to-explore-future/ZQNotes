//
//  Vc2.m
//  页面跳转
//
//  Created by to-explore-future on 17/10/25.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "Vc2.h"
#import "Vc3.h"

@interface Vc2 ()

@end

@implementation Vc2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    self.title = @"Vc2";
    
    self.navigationItem.title = @"Vc2";
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)next {
    Vc3 *v3 = [[Vc3 alloc] init];
    [self.navigationController pushViewController:v3 animated:YES];
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
