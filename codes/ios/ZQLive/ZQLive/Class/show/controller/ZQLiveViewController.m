//
//  ZQLiveViewController.m
//  ZQLive
//
//  Created by to-explore-future on 17/11/4.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQLiveViewController.h"
#import "ZQCustomLiveStreamingTitle.h"

@interface ZQLiveViewController ()<UIScrollViewDelegate,ZQCustomLiveStreamingTitleDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property(nonatomic,strong)NSArray * liveStreamingTitleList;

@property(nonatomic,strong)ZQCustomLiveStreamingTitle * topTitleView;

@property(nonatomic,weak) id<ZQLiveViewControllerDelegate> delegate;

@end

@implementation ZQLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];    
    //每个页面添加View的时候  是按照navigationBar左下角的点 作为起点添加的。
    //但是这个setContentOffset 是按照屏幕的 左上角的 点 添加的。
    //所有使用 setContentOffset方法的时候 为了保证子view的位置 保持不变 ，
    //scrllview的 要考虑到 statuesBar and navigationBar 的高度
    NSInteger statusBarHeight =  [[UIApplication sharedApplication] statusBarFrame].size.height;
    NSInteger navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    NSInteger allHeight = statusBarHeight + navigationBarHeight;
    statusBarAndNavigationBarHeight = allHeight;
}

//从 ZQCustomLiveStreamingTitle 回调
- (void)button:(UIButton *)button{
    NSInteger tag =  button.tag;
    NSInteger scrollViewPage = tag - 200;
    [UIView animateWithDuration:0.5 animations:^{
        [self.scrollView setContentOffset:CGPointMake(scrollViewPage * SCREEN_WIDTH, -statusBarAndNavigationBarHeight )];
    }];
    [self load_VC_if_NoneLoaded:scrollViewPage];
}

-(void)initView{
    [self addLeftRightButton];
    //添加子视图控制器
    //在这个直播页面中 ，有三个可以相互滑动的页面，这个使用三个视图控制器实现，
    //每个控制器中写自己的内容，首先去创建这个三个试图控制器
    [self addSubViewControllers];
    self.navigationItem.titleView = self.topTitleView;
    
    //第一次默认让scrollView滑动到 热门的位置
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, -statusBarAndNavigationBarHeight )];
}

//创建topviewtitle
-(ZQCustomLiveStreamingTitle *)topTitleView{
//    NSInteger titleBarHeight = self.navigationItem.titleView.frame.size.height;
//    NSLog(@"titleBarHeight = %ld",titleBarHeight);
    if (!_topTitleView) {
        
        _topTitleView = [[ZQCustomLiveStreamingTitle alloc] initWithFrame:CGRectMake(0, 0, 200, 40) AndTitleNames:self.liveStreamingTitleList];
    }
    _topTitleView.delegate = self;
    self.delegate = _topTitleView;
    return _topTitleView;
}

-(void)addSubViewControllers{
    
    //创建 subViewControllers
    NSArray * vcNames = @[@"ZQAttentionViewController",@"ZQHotViewController",@"ZQNearbyViewController"];
    for (NSInteger i = 0; i < vcNames.count; i++) {
        NSString * vcName = vcNames[i];
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        
        vc.title = self.liveStreamingTitleList[i];
        [self addChildViewController:vc];
    }
    
    //将创建的viewController 添加到 scrollView上
    
    //设置srollView 的contentSize
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.liveStreamingTitleList.count, 0);
    self.scrollView.scrollEnabled = YES;
    self.scrollView.alwaysBounceHorizontal  = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    
    //默认加载热门页面
    NSInteger index = [self.liveStreamingTitleList indexOfObject:@"热门"];
    [self load_VC_if_NoneLoaded:index];
}

//当scrollView停止加速的时候回调
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //停止加速我要确定 当前停止到了哪个页面上面，
    NSInteger pageIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
    NSLog(@"pageIndex = %ld",pageIndex);
    [self.delegate scrollViewPageIndex:pageIndex];
    
    //每次加速停止 都要看看当前这个页面是否 加载过了 如果没有加载过 就加载
    [self load_VC_if_NoneLoaded:pageIndex];
}

//判断 scrollview 中的viewController 是否加载过 如果没有加载过的话，就加载
//用于 当用户 点击按钮 滑到 对应的 viewcontroller页面的时候，加载这个viewcontroller
- (void) load_VC_if_NoneLoaded:(NSInteger) index{
    UIViewController *vc = self.childViewControllers[index];
    if ([vc isViewLoaded]) {
        return;
    }else{
        vc.view.frame = CGRectMake(index*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self.scrollView addSubview:vc.view];
    }
}

//添加左上角和右上角的 button
-(void)addLeftRightButton{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc  ] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//
-(NSArray * )liveStreamingTitleList{
    if (!_liveStreamingTitleList) {
        _liveStreamingTitleList = @[@"关注",@"热门",@"周边"];
    }
    return _liveStreamingTitleList;
}

@end
