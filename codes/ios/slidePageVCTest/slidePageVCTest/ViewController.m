//
//  ViewController.m
//  slidePageVCTest
//
//  Created by sharingmobile on 2018/3/14.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "ViewController.h"
#import "NHHomeHeaderOptionalView.h"
#import "NHCustomSlideViewController.h"

@interface ViewController ()<NHCustomSlideViewControllerDataSource, NHCustomSlideViewControllerDelegate>{
    UIButton *channelChangeBtn;
}

@property (nonatomic,strong)    NHHomeHeaderOptionalView * optionalView;
@property (nonatomic, weak)     NHCustomSlideViewController *slideViewController;
@property (nonatomic, strong)   NSMutableArray *controllers;
@property (nonatomic,strong)    NSArray * titles;
@property (nonatomic, assign)   NSInteger nowIndex;//当前选中索引值

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view setBackgroundColor:[UIColor greenColor]];
   
    //搞一个名称数组
    self.titles = @[@"11",@"21",@"31",@"41",@"15"];
    self.optionalView.titles = self.titles;
    //根据数组的长度 生成 slideView的vcs
    for (int i = 0; i < self.titles.count; i++) {
        UIViewController * vc = [[UIViewController alloc] init];
//        [vc.view setBackgroundColor:randomColor];
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(vc.view.frame.size.width/ 2- 40, vc.view.frame.size.height/ 2, 100, 30)];
        [btn setTitle:@"我是测试" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [vc.view addSubview:btn];
        [self.controllers addObject:vc];
    }
    [self.view addSubview:self.optionalView];
    XXWeakSelf(self);
    self.optionalView.homeHeaderOptionalViewItemClickHandle = ^(NHHomeHeaderOptionalView *view, NSString *currentTitle, NSInteger currentIndex) {
        weakSelf.slideViewController.seletedIndex = currentIndex;
        weakSelf.nowIndex = currentIndex;
    };
    
    [self addChildViewController:self.slideViewController];
}

#pragma mark - delegate <NHCustomSlideViewControllerDataSource, NHCustomSlideViewControllerDelegate >

- (NSInteger)numberOfChildViewControllersInSlideViewController:(NHCustomSlideViewController *)slideViewController {
    return self.titles.count;
}

- (UIViewController *)slideViewController:(NHCustomSlideViewController *)slideViewController viewControllerAtIndex:(NSInteger)index {
    return self.controllers[index];
}

- (void)customSlideViewController:(NHCustomSlideViewController *)slideViewController slideOffset:(CGPoint)slideOffset {
    self.optionalView.contentOffset = slideOffset;
}

- (void)customSlideViewController:(NHCustomSlideViewController *)slideViewController slideIndex:(NSInteger)slideIndex{
    self.nowIndex = slideIndex;
}

#pragma mark - lazyload

- (NHHomeHeaderOptionalView *)optionalView {
    if (!_optionalView) {
        NHHomeHeaderOptionalView *optional = [[NHHomeHeaderOptionalView alloc] init];
        optional.frame = CGRectMake(0, 0, kScreen_width, 40);
        [self.view addSubview:optional];
        _optionalView = optional;
        optional.backgroundColor = [UIColor whiteColor];
    }
    return _optionalView;
}

- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}

- (NHCustomSlideViewController *)slideViewController {
    if (!_slideViewController) {
        NHCustomSlideViewController *slide = [[NHCustomSlideViewController alloc] init];
        [slide.view setBackgroundColor:[UIColor clearColor]];
        [slide willMoveToParentViewController:self];
        [self.view addSubview:slide.view];
        slide.view.frame = CGRectMake(0, self.optionalView.frame.origin.y+self.optionalView.frame.size.height, kScreen_width, kScreen_height - self.optionalView.frame.size.height - 64);
        slide.delgate = self;
        slide.dataSource = self;
        _slideViewController = slide;
    }
    return _slideViewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
