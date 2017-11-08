//
//  ZQBaseViewController.m
//  ZQLive
//
//  Created by to-explore-future on 17/11/4.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQBaseViewController.h"

@interface ZQBaseViewController ()

@end

@implementation ZQBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
