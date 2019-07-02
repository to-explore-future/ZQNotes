//
//  ViewController.m
//  categraryViewTest
//
//  Created by haoqiao on 2019/6/24.
//  Copyright © 2019 zq. All rights reserved.
//

#import "ViewController.h"
#import "JXCategoryView.h"
#import "ListViewController.h"


@interface ViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>

@property(nonatomic,strong)JXCategoryTitleView * categoryView;
@property(nonatomic,strong)JXCategoryListContainerView * listContainerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 50, screenWidth, 50)];
    
    self.categoryView.delegate = self;
    [self.view addSubview:self.categoryView];
    
    self.categoryView.titles = @[@"螃蟹", @"麻辣小龙虾", @"苹果"];
    self.categoryView.titleColorGradientEnabled = YES;

    
    self.listContainerView = [[JXCategoryListContainerView alloc] initWithDelegate:self];
    self.listContainerView.frame = CGRectMake(0, 200, screenWidth , 200);
    [self.view addSubview:self.listContainerView];
    //关联cotentScrollView，关联之后才可以互相联动！！！
    self.categoryView.contentScrollView = self.listContainerView.scrollView;
    
    
}

//返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.categoryView.titles.count;
}

//返回遵从`JXCategoryListContentViewDelegate`协议的实例
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    return [[ListViewController alloc] init];
}

//传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    [self.listContainerView didClickSelectedItemAtIndex:index];
}

//传递scrolling事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio {
    [self.listContainerView scrollingFromLeftIndex:leftIndex toRightIndex:rightIndex ratio:ratio selectedIndex:categoryView.selectedIndex];
}


@end
