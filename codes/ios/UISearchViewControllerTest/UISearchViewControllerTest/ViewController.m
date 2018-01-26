//
//  ViewController.m
//  UISearchViewControllerTest
//
//  Created by 869518570@qq.com on 18/1/18.
//  Copyright © 2018年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating>

/**
 *  虽然这个是继承自 UIViewController，但是这个不能像自己写的viewContrller那样，push... present...
 *  这个是官方提供的用来搞搜索栏，
 */
@property(nonatomic,strong)UISearchController   * searchController;
@property(nonatomic,strong)UITableView          * tableView ;
@property(nonatomic,strong)NSMutableArray       * originDataArray;
@property(nonatomic,strong)NSMutableArray       * searchResultArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initFrame];
    
}

-(void)initData{
    self.originDataArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0 ; i < 1000; i++) {
        NSString * temp = [NSString stringWithFormat:@"test%d",i];
        [self.originDataArray addObject:temp];
    }
    self.searchResultArray = [NSMutableArray array];
    
}

-(void)initFrame{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat width  = screenSize.width;
    CGFloat height = screenSize.height;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    self.tableView.delegate     = self;
    self.tableView.dataSource   = self;
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
    //UISearchController
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.delegate              = self;
    self.searchController.searchResultsUpdater  = self;
    //searchBar
    self.searchController.searchBar.tintColor = [UIColor greenColor];
    self.searchController.searchBar.placeholder = @"搜索";
    self.searchController.searchBar.text = @"我是输入的文字";
    //设置searchController的背景属性
    self.searchController.dimsBackgroundDuringPresentation      = NO;  //dims
    self.searchController.obscuresBackgroundDuringPresentation  = NO;  //obscures
    self.searchController.hidesNavigationBarDuringPresentation  = YES;  //hides
    
    self.searchController.searchBar.frame = CGRectMake(0, 0, width, 44);
    self.searchController.searchBar.backgroundColor = [UIColor greenColor];
    
    self.tableView.tableHeaderView = self.searchController.searchBar;        
    
    [self.view addSubview:self.tableView];
}

#pragma mark - tableview delegate datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchController.active) {
        return  self.searchResultArray.count;
    }else{
        return self.originDataArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (self.searchController.active) {
        cell.textLabel.text = self.searchResultArray[indexPath.row];
    }else{
        cell.textLabel.text = self.originDataArray[indexPath.row];
    }
    return cell;
}


#pragma mark - UISearchController delegate dataSource

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString * searchString = [self.searchController.searchBar text];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",searchString];
    if (self.searchResultArray != nil) {
        [self.searchResultArray removeAllObjects];
    }
    //得到过滤的数据
    self.searchResultArray = [NSMutableArray arrayWithArray:[self.originDataArray filteredArrayUsingPredicate:predicate]];
    [self.tableView reloadData];
}

#pragma  mark - other

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




































@end
