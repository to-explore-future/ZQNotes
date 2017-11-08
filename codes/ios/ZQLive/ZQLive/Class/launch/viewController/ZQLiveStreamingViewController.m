//
//  ZQLiveStreamingViewController.m
//  ZQLive
//
//  Created by to-explore-future on 17/11/4.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQLiveStreamingViewController.h"

@interface ZQLiveStreamingViewController ()

@end

@implementation ZQLiveStreamingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)closeLiveStreaming:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
