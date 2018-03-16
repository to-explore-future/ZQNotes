//
//  ViewController.m
//  CollectionviewTest
//
//  Created by sharingmobile on 2018/3/15.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "ViewController.h"

#define screenWidth [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property CGFloat colletionViewHeaderHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.headerReferenceSize = CGSizeMake(10, self.colletionViewHeaderHeight);
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个Item的大小
    //每个Item之间的space 可以提供过方法的回调设置,可以更具间隙 计算出 每个item的 宽度
    //比如说像展示 一行显示4个Item 每个Item之间的间隙为 10
    CGFloat itemSpace = 3;
    CGFloat itemCount = 4;
    CGFloat itemWidth =(screenWidth - ((itemCount - 1)* itemSpace)) / itemCount;
    //假如设置宽高相等
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    //创建
    UICollectionView * collect = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [collect setBackgroundColor:[UIColor whiteColor]];
    collect.delegate = self;
    collect.dataSource = self;
    
    //需要注册一个 cell 可以自定义
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [collect registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    [self.view addSubview:collect];
}

-(void)initData{
    self.colletionViewHeaderHeight = 40;
}

#pragma mark - delegate collectionview delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 9;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}

//这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView * reusableView;
    if (kind==UICollectionElementKindSectionHeader) {
        reusableView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
//        reusableView = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    }
    
    reusableView.backgroundColor = [UIColor whiteColor];
    //日期
    CGFloat labelHeight = 30;
    UILabel * time = [[UILabel alloc] initWithFrame:CGRectMake(10, (self.colletionViewHeaderHeight - labelHeight) / 2 + 10, 100, labelHeight)];
    [time setText:@"10月13日"];
    time.textColor = [UIColor blackColor];
    [time setFont:[UIFont systemFontOfSize:20]];
    [reusableView addSubview:time];
    //向右的箭头
    CGFloat rightArrowWidth = self.colletionViewHeaderHeight;
    UIButton * rightArrow = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth - rightArrowWidth,0 + 10, rightArrowWidth, rightArrowWidth)];
    [rightArrow setImage:[UIImage imageNamed:@"rightarrow_2f"] forState:UIControlStateNormal];
    [rightArrow setBackgroundColor:[UIColor whiteColor]];
    [reusableView addSubview:rightArrow];
    
    return reusableView;
}


//定义每个Section的四边间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(15, 0, 15, 0);//分别为上、左、下、右
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
