//
//  ViewController.m
//  团购自定义 cell
//
//  Created by to-explore-future on 17/11/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "GoodsModel.h"
#import "GoodsCell.h"
#import "tableFooterView.h"

@interface ViewController ()<UITableViewDataSource,tableFooterViewDelegate>

@property(nonatomic,strong)             NSMutableArray      * goods;
@property (weak, nonatomic) IBOutlet    UITableView         * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置 tableview 的 footerView
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    //经过测试 tableFooterView 可以对 x height 进行设置
//    self.tableView.tableFooterView = button;
//    button.frame = CGRectMake(20, 20, 100, 300);
//    button.backgroundColor = [UIColor redColor];
    tableFooterView * footerView = [[[NSBundle mainBundle] loadNibNamed:@"tableFooterView" owner:nil options:nil] firstObject];
    self.tableView.tableFooterView = footerView;
    footerView.delegate = self;
    
}

#pragma mark - lazyLoad

-(NSMutableArray *)goods{
    if (_goods == nil) {
        _goods = [NSMutableArray array];
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray * array = [NSArray arrayWithContentsOfFile:plistPath];
        NSLog(@"array.count = %ld",array.count);
        for (NSDictionary * dic in array) {
            GoodsModel * good = [GoodsModel modelWithDic:dic];
            [_goods addObject:good];
        }
    }
    return _goods;
}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"goods.count = %ld",self.goods.count);
    return self.goods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"section:    %ld,row:    %ld",indexPath.section,indexPath.row);
//    NSString * ID = @"cell_ID";
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//    //设置数据
//    GoodsModel * model = self.goods[indexPath.row];
//    cell.imageView.image        = [UIImage imageNamed:model.icon];
//    cell.textLabel.text         = model.title;
//    cell.detailTextLabel.text   = [NSString stringWithFormat:@"$ %@                         %@人已购买",model.price,model.buyCount];
//    //遇到复杂的页面 系统提供的样式就不够用了，需要自定义
    
    //1.拿到 cell
    GoodsCell * cell    = [GoodsCell goodsCellWithTableView:tableView];
    //2.拿到数据
    //3.设置数据
    GoodsModel * model  = self.goods[indexPath.row];
    cell.good           = model;
    return cell;
}

#pragma mark - tableFooterView 的代理方法

- (void)tableFooterViewUpdateData:(tableFooterView *)tableFooterView{
    //footerView 中 按钮被点击之后  回调这个方法
    // 增加一个 model 添加到数组中
    GoodsModel * model = [[GoodsModel alloc]init];
    model.title     = @"圣诞套装";
    model.price     = @"9999";
    model.buyCount  = @"1";
    model.icon      = @"2c97690e72365e38e3e2a95b934b8dd2";
    [_goods addObject:model];
    //刷新数据
    [self.tableView reloadData];
    
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:(self.goods.count - 1) inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


@end





















