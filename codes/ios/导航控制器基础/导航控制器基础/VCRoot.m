//
//  VCRoot.m
//  导航控制器基础
//
//  Created by to-explore-future on 17/10/25.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    //这里的title属于 UIAlertController 里面的title
    self.title = @"设置";
    
    //这里的title 属于 UINavigationItem 里面的title
    self.navigationItem.title = @"setting";
    
    //这两个title的优先级  系统会先找 navigationItem.title 然后 UIAlertController.title
    
    //添加button
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"左侧" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtn)];
    
    self.navigationItem.leftBarButtonItem = leftBtn;

    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBtn)];
    /*
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    */
    
    //添加多个按钮
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    label.text = @"开始";
    label.textColor = [UIColor orangeColor];
    UIBarButtonItem * item03 = [[UIBarButtonItem alloc] initWithCustomView:label];
    
    
    NSArray * btnArrays = [[NSArray alloc] initWithObjects:rightBtn,item03, nil];
    self.navigationItem.rightBarButtonItems = btnArrays;
    
}

- (void ) label1{
    NSLog(@"label被点击");
}
- (void)leftBtn{
    NSLog(@"左侧按钮被点击");
}

- (void)rightBtn{
    NSLog(@"右侧按钮被点击");
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
