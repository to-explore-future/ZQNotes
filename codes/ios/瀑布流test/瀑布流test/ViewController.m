//
//  ViewController.m
//  瀑布流test
//
//  Created by sharingmobile on 2018/3/13.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "ViewController.h"
#import "JRWaterFallLayout.h"
#import "JRShopCell.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "JRShop.h"

// collectionViewCell的重用标识符
static NSString * const shopCellReuseID = @"shop";


@interface ViewController ()<JRWaterFallLayoutDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView * collectionView;//瀑布流

@property(nonatomic,strong)NSMutableArray * shops;

/** 当前页码 */
@property (nonatomic, assign) NSUInteger currentPage;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //当前页码为0
    self.currentPage = 0;
    //初始化瀑布流
    JRWaterFallLayout * layout = [[JRWaterFallLayout alloc] init];
    //设置代理
    layout.delegate = self;

    //创建瀑布流
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];

    //设置数据源
    collectionView.dataSource = self;
    [collectionView setBackgroundColor:[UIColor whiteColor]];

    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    //可以在这里注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JRShopCell class]) bundle:nil] forCellWithReuseIdentifier:shopCellReuseID];
    
    //为瀑布流控件添加上拉加载 和 下拉刷新
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.shops removeAllObjects];
            [self.shops addObjectsFromArray:[self newShops]];
            [self.collectionView reloadData];
            [self.collectionView.mj_header endRefreshing];
        });
    }];
    
    //第一进入的时候 首先刷新
    [self.collectionView.mj_header beginRefreshing];
    
    //添加上拉加载
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
            [self.shops addObjectsFromArray:[self moreShopsWithCurrentPage:self.currentPage]];
            [self.collectionView reloadData];
            [self.collectionView.mj_footer endRefreshing];
        });
    }];
}

- (NSArray *)moreShopsWithCurrentPage:(NSUInteger)currentPage{
    // 页码的判断 ,因为plist 中数据有限
    if (currentPage == 3) {
        self.currentPage = 0;
    } else {
        self.currentPage++;
    }
    NSString *nextPage = [NSString stringWithFormat:@"%lu.plist", self.currentPage];
    NSLog(@"nextPage = %@",nextPage);
    return [JRShop mj_objectArrayWithFilename:nextPage];
}

#pragma mark - 内部方法
- (NSArray *)newShops{
    return [JRShop mj_objectArrayWithFilename:@"0.plist"];//打plist 转变成 数组
}

#pragma mark - delegate

#pragma mark - delegate JRWaterFallLayoutDelegate

- (CGFloat)waterFallLayout:(JRWaterFallLayout *)waterFallLayout heightForItemAtIndex:(NSUInteger)index width:(CGFloat)width{
    JRShop *shop = self.shops[index];
    CGFloat shopHeight = [shop.h doubleValue];
    CGFloat shopWidth = [shop.w doubleValue];
    return shopHeight * width / shopWidth;
}

#pragma mark - delegate UICollectionViewDateSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.shops.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JRShopCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:shopCellReuseID forIndexPath:indexPath] ;
    cell.shop = self.shops[indexPath.item];
    
    return cell;
}

-(NSMutableArray *)shops{
    if (_shops == nil) {
        _shops = [NSMutableArray array];
    }
    return _shops;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
