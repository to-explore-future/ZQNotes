//
//  ViewControllerHome.m
//  关于ScrollView
//
//  Created by to-explore-future on 17/11/18.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewControllerHome.h"

@interface ViewControllerHome ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView   * scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl  * pageController;
@property(nonatomic,assign)          NSInteger        currentPage;
@property(nonatomic,assign)          CGFloat          scrollViewWidth;
@property(nonatomic,assign)          Boolean          isForward;
@property(nonatomic,strong)          NSTimer        * timer;

@end

@implementation ViewControllerHome

- (void)viewDidLoad {
    [super viewDidLoad];
    int imageCount = 6;
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollViewWidth = self.scrollView.frame.size.width;
    
    CGSize contentSize = [UIScreen mainScreen].bounds.size;
    self.scrollView.contentSize     = CGSizeMake(contentSize.width * imageCount, 125);
    self.scrollView.pagingEnabled   = YES;
    self.scrollView.delegate        = self;
    for (int i = 0 ; i < imageCount; i++) {
        NSString    * imageName     = [NSString stringWithFormat:@"%d.jpg",i + 1];
        UIImage     * image         = [UIImage imageNamed:imageName];
        UIImageView * imageView     = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(i * contentSize.width,0, contentSize.width, 125);
        [self.scrollView addSubview:imageView];
    }
    
    //搞一个定时器 让 carousel controls 动起来
    [self creatTimer];
    
    
}

#pragma mark - scrollView

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{    //这种方法求 page 效率会高一点我感觉 ，回调次数少
    CGFloat x = scrollView.contentOffset.x;
    CGSize contentSize = [UIScreen mainScreen].bounds.size;
    _currentPage = x / contentSize.width;
    [self.pageController setCurrentPage:_currentPage];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{     //当开始拖拽的时候 停掉计时器
    [_timer invalidate];        //计时器一旦失效 计时器就会销毁
    _timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self creatTimer];
}

-(void)scrollImage{
    if (_currentPage == 5){    //只是管理方向
        _isForward = NO;
    }if(_currentPage == 0){
        _isForward = YES;
    }
    if (_isForward) {           //往前走
        CGFloat x = self.scrollView.contentOffset.x;
        CGPoint newPoint = CGPointMake(x + _scrollViewWidth, 0);
        [self.scrollView setContentOffset:newPoint animated:YES];
        _currentPage++;
    }else{                      //往回退
        CGFloat x = self.scrollView.contentOffset.x;
        CGPoint newPoint = CGPointMake(x - _scrollViewWidth, 0);
        [self.scrollView setContentOffset:newPoint animated:YES];
        _currentPage--;
    }
    [_pageController setCurrentPage:_currentPage];
}

- (void)creatTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    NSRunLoop * loop = [NSRunLoop currentRunLoop];
    [loop addTimer:_timer forMode:NSRunLoopCommonModes];        //让 timer 的优先级和 UI 控件一样高
}




@end
