//
//  ViewController.m
//  NSSessionTest
//
//  Created by sharingmobile on 2018/3/12.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray * methods;
@property(nonatomic,strong)UITableView * tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.methods = @[@"第一种网络请求方法",@"第二种网络请求方法"];
    [self.view addSubview:self.tableview];
}

#pragma mark - delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.methods.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifire = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifire];
    NSString * text = self.methods[indexPath.row];
    [cell.textLabel setText:text];
    return cell;
}


-(UITableView *)tableview{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        _tableview.delegate = self;
//        _tableview.dataSource = self;
    }
    return _tableview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
