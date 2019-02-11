//
//  CategoryTestVC.m
//  IOS_practice
//
//  Created by haoqiao on 2019/2/1.
//  Copyright © 2019 zq. All rights reserved.
//

#import "CategoryTestVC.h"
#import "NSString+Test.h"

@interface CategoryTestVC ()

@end

@implementation CategoryTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分类的使用";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    NSString * string = [NSString OneString:@"oneString" plusAnotherString:@"anotherString"];
    NSLog(@"%@",string);
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
