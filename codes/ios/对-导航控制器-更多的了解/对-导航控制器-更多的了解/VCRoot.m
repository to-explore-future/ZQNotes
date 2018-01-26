//
//  VCRoot.m
//  对-导航控制器-更多的了解
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
    self.view.backgroundColor = [UIColor orangeColor ];
    
    //控制导航栏
    //通过style 设置颜色
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
//    
//    //UIBarStyleBlackOpaque 并不能显示不透明的黑色 加上下面的代码
//    self.navigationController.navigationBar.translucent = NO;
    
    //另一种设置导航栏颜色的方式：直接设置颜色
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    //设置按钮的颜色
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithTitle:@"按钮" style:UIBarButtonItemStyleDone target:self action:@selector(btn1)];
    
    self.navigationItem.rightBarButtonItem = btn;
    
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    
    //隐藏导航栏
    //这个是navigationController 的一个属性
    self.navigationController.navigationBarHidden = NO;
    //这个方法是 UIView 中的一个属性
    self.navigationController.navigationBar.hidden = NO;
    
    
    
    
    // toolbar
    // 显示工具栏
    self.navigationController.toolbarHidden = NO;
    
    //工具栏的透明度 颜色
    self.navigationController.toolbar.translucent = NO;
    
    //修改toobar 的颜色
    self.navigationController.toolbar.barTintColor = [UIColor greenColor];
    
    // 给toolbar添加几个按钮
    
    UIBarButtonItem *b1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(btn1)];
    UIBarButtonItem * b2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(btn1)];
    UIBarButtonItem * b3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(btn1)];
    //占位按钮
    UIBarButtonItem * bb = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    bb.width = 100;
    //可变宽度按钮 相比于手动设置宽度，这种不用设置宽度，按钮被均分的更准确
    UIBarButtonItem * flexibleBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSArray *btnArrays = [[NSArray alloc] initWithObjects:b1,flexibleBtn,b2,flexibleBtn,b3, nil];
    self.toolbarItems = btnArrays;
    
    /*
     最后总结一下：导航栏和toobar 是属于导航控制器的，而 导航栏中的按钮和toolbar中的按钮是属于 viewController的
     一个应用中貌似只有一个导航控制器，导航控制器是用来管理视图控制器的 --> 有点像Android中acvitityManager管理activity
     工具栏 导航栏 属于导航控制器，
     */
}

- (void) btn1{
    
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
