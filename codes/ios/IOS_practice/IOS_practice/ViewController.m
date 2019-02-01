//
//  ViewController.m
//  IOS_practice
//
//  Created by haoqiao on 2019/2/1.
//  Copyright © 2019 zq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property(strong,nonatomic) UITableView * tableView;
@property NSString * cellIdentifier;
@property(strong,nonatomic) NSMutableArray * knowledgeTitles; //知识点的标题

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData{
    self.cellIdentifier = @"identifier";
    self.knowledgeTitles = [NSMutableArray arrayWithObjects:@"测试", nil];
}

- (void)initView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
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


@end
