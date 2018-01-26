//
//  ViewController.m
//  cell的高度自动计算的三方开源库
//
//  Created by 869518570@qq.com on 17/12/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "TableViewCell1.h"
#import "TableViewCell2.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view  addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - tableView delegate 

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return [tableView fd_heightForCellWithIdentifier:@"reusecell" configuration:^(id cell) {
//        // Configure this cell with data, same as what you've done in "-tableView:cellForRowAtIndexPath:"
//        // Like:
//        //    cell.entity = self.feedEntities[indexPath.row];
//    }];
    
//    return 40;
    
    if (indexPath.row % 2 == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"reusecell1" configuration:^(id cell) {
            // Configure this cell with data, same as what you've done in "-tableView:cellForRowAtIndexPath:"
            // Like:
            //    cell.entity = self.feedEntities[indexPath.row];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:@"reusecell2" configuration:^(id cell) {
            // Configure this cell with data, same as what you've done in "-tableView:cellForRowAtIndexPath:"
            // Like:
            //    cell.entity = self.feedEntities[indexPath.row];
        }];
    }
    
}

#pragma mark - tableView dataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = nil;
    if (indexPath.row % 2 == 0) {
        cell = [[TableViewCell1 alloc]init];
    }else{
        cell = [[TableViewCell2 alloc]init];
    }
    
    
    return cell;
}



#pragma mark - lazyload

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
//        [_tableView registerClass:[TableViewCell1 class] forCellReuseIdentifier:@"reusecell1"];
//        [_tableView registerClass:[TableViewCell2 class] forCellReuseIdentifier:@"reusecell2"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        self.tableView.fd_debugLogEnabled = YES;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
