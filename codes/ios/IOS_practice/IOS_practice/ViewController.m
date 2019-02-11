//
//  ViewController.m
//  IOS_practice
//
//  Created by haoqiao on 2019/2/1.
//  Copyright © 2019 zq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) UITableView * tableView;
@property NSString * cellIdentifier;
@property(strong,nonatomic) NSMutableArray * knowledgeTitles;   //知识点的标题
@property(strong,nonatomic) NSMutableArray * classNames;        //所有类的名称

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData{
    self.title = @"IOS 练习 集合";
    self.cellIdentifier = @"identifier";
    self.knowledgeTitles = [NSMutableArray arrayWithObjects:@"分类的使用",@"masonry的使用",@"阴影的使用",@"swift 练习",nil];
    self.classNames = [NSMutableArray arrayWithObjects:@"CategoryTestVC",@"MasonryTestVC",@"ShadowTestVC", nil];
}

- (void)initView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

#pragma - mark UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.knowledgeTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    cell.textLabel.text = self.knowledgeTitles[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}

#pragma - mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * className = self.classNames[indexPath.row];
    UIViewController * viewController = [[NSClassFromString(className) alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}



@end
