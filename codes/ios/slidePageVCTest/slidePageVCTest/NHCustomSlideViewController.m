//
//  NHCustomSlideViewController.m
//  NeiHan
//
//  Created by Charles on 16/8/31.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "NHCustomSlideViewController.h"

@interface NHCustomSlideViewController () <UIScrollViewDelegate>{
    CGRect catchViewFrame;
    CGRect catchViewBound;
}

@property (nonatomic, weak)     UIScrollView            *scrollView;
@property (nonatomic, strong)   NSMutableDictionary     *displayVcs;
@property (nonatomic, strong)   NSMutableDictionary     *memoryCache;

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, weak) UIViewController *currentViewController;
@end


@implementation NHCustomSlideViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * [self childViewControllerCount], self.scrollView.frame.size.height);
}

- (void)setSeletedIndex:(NSInteger)seletedIndex {
    _seletedIndex = seletedIndex;
    [self.scrollView setContentOffset:CGPointMake(kScreen_width * seletedIndex, 0) animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

//当点击顶部的Item的时候 Item回调，设置当前的VC的position,
- (void)reloadData {
    
    [self.memoryCache removeAllObjects];    //清除缓存
    [self.displayVcs removeAllObjects];     //
    
    //将所有的viewController清除
    for (NSInteger index = 0; index < self.childViewControllers.count; index++) {
        UIViewController *viewController = self.childViewControllers[index];
        [viewController.view removeFromSuperview];
        [viewController willMoveToParentViewController:nil];
        [viewController removeFromParentViewController];
    }
    
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * [self childViewControllerCount], self.scrollView.frame.size.height);
    [self scrollViewDidScroll:self.scrollView];
}

// 添加控制器
- (void)addChildViewController:(UIViewController *)childController atIndex:(NSInteger)index {
    
    if ([self.childViewControllers containsObject:childController]) {
        return ;
    }
    
    // 添加控制器 并放入正在展示的控制器中
    [self addChildViewController:childController];
    [self.displayVcs setObject:childController forKey:@(index)];
    [childController didMoveToParentViewController:self];
    [self.scrollView addSubview:childController.view];
    childController.view.frame = CGRectMake(index * [UIScreen mainScreen].bounds.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);;
}

// 移除控制器
- (void)removeChildViewController:(UIViewController *)childController atIndex:(NSInteger)index {
    
    if (childController == nil) {
        return ;
    }
    // 当前显示删除、放入缓存中
    [childController.view removeFromSuperview];
    [childController willMoveToParentViewController:nil];
    [childController removeFromParentViewController];
    
    [self.displayVcs removeObjectForKey:@(index)];
    if (![self.memoryCache objectForKey:@(index)]) {
        [self.memoryCache setObject:childController forKey:@(index)];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / kScreen_width;

     // 防止控制器切换的时候视频还在播放
    NSInteger start = currentPage;
    NSInteger end = (currentPage == [self childViewControllerCount] - 1) ? currentPage : (currentPage);
    
    for (NSInteger index = start; index <= end; index++) {
        UIViewController *viewController = [self.displayVcs objectForKey:@(index)];
        if (viewController == nil) {
            // 获取当前控制器
            [self initializedViewControllerAtIndex:index];
        }
    }
    
    // 将start之前和end之后的放入缓存中
    for (NSInteger index = 0; index <= start - 1; index++) {
        UIViewController *viewController = [self.displayVcs objectForKey:@(index)];
        [self removeChildViewController:viewController atIndex:index];
    }
    
    for (NSInteger index = end + 1; index <= [self childViewControllerCount] - 1; index++) {
        UIViewController *viewController = [self.displayVcs objectForKey:@(index)];
        [self removeChildViewController:viewController atIndex:index];
    }
    
    // 将scrollview的scroll动作传出去 传出去之后呢 在VC界面 把动作传给 optiOnview 让optionview 变化
    if ([self.delgate respondsToSelector:@selector(customSlideViewController:slideOffset:)]) {
        [self.delgate customSlideViewController:self slideOffset:scrollView.contentOffset];
    }
    catchViewFrame = self.view.frame;
    catchViewBound = self.view.bounds;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([self.delgate respondsToSelector:@selector(customSlideViewController:slideIndex:)]) {
        [self.delgate customSlideViewController:self slideIndex:scrollView.contentOffset.x / kScreen_width];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if ([self.delgate respondsToSelector:@selector(customSlideViewController:slideOffset:)]) {
        [self.delgate customSlideViewController:self slideOffset:scrollView.contentOffset];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([self.delgate respondsToSelector:@selector(customSlideViewController:slideOffset:)]) {
        [self.delgate customSlideViewController:self slideOffset:scrollView.contentOffset];
    }
}
// 获取当前控制器
// 1. 从缓存中
// 2. 从代理中获取并且放入缓存中
- (void)initializedViewControllerAtIndex:(NSInteger)index {
    // 从缓存中取出控制器
    UIViewController *viewController = [self.memoryCache objectForKey:@(index)];
    if (viewController == nil) {
        if ([self.dataSource respondsToSelector:@selector(slideViewController:viewControllerAtIndex:)]) {
            UIViewController *viewController = [self.dataSource slideViewController:self viewControllerAtIndex:index];
            [self addChildViewController:viewController atIndex:index];
        }
    } else {
        [self addChildViewController:viewController atIndex:index];
    }
}

- (NSInteger)childViewControllerCount {
    if ([self.dataSource respondsToSelector:@selector(numberOfChildViewControllersInSlideViewController:)]) {
        return [self.dataSource numberOfChildViewControllersInSlideViewController:self];
    }
    return 0;
}



- (NSMutableDictionary *)displayVcs {
    if (!_displayVcs) {
        _displayVcs = [[NSMutableDictionary alloc] init];
    }
    return _displayVcs;
}

- (NSMutableDictionary *)memoryCache {
    if (!_memoryCache) {
        _memoryCache = [[NSMutableDictionary alloc] init];
    }
    return _memoryCache;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        UIScrollView *scroll = [[UIScrollView alloc] init];
        [self.view addSubview:scroll];
        _scrollView = scroll;
        scroll.delegate = self;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.showsVerticalScrollIndicator = NO;
        scroll.pagingEnabled = YES;
        scroll.bounces = NO;
    }
    return _scrollView;
}
@end
