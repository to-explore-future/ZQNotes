//
//  ViewController.m
//  UIView基础
//
//  Created by to-explore-future on 17/10/20.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)view的几种属性{
    //view的几种常用属性
    //  hidden,opaque,alpha;
    
    UIView * view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 100, 100);
    view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view];
    
    //view.hidden = YES;//是否隐藏 NO
    view.alpha = 0.9;//透明度
    view.opaque = YES;//设置是否显示不透明
    
    //[view removeFromSuperview];//把自己从父View中移除

}

//view 的层级关系
- (void)view的层级关系{
    UIView * view1 = [[UIView alloc] init];
    UIView * view2 = [[UIView alloc] init];
    UIView * view3 = [[UIView alloc] init];
    
    view1.frame = CGRectMake(100, 100, 100, 100);
    view2.frame = CGRectMake(130, 130, 100, 100);
    view3.frame = CGRectMake(160, 160, 100, 100);
    
    view1.backgroundColor = [UIColor blueColor];
    view2.backgroundColor = [UIColor orangeColor];
    view3.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    
    //改变View的绘制顺序
    [self.view bringSubviewToFront:view1];
    [self.view sendSubviewToBack:view3];
    
    //每一个子view都 放到了 subviews中
    UIView * viewFront = self.view.subviews[2]  ;
    UIView * viewBack = self.view.subviews[0]   ;
    
    if(view3 == viewBack){
        NSLog(@"相等");
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self view的几种属性];
    [self view的层级关系];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
