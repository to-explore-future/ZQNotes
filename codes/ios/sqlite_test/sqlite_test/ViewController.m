//
//  ViewController.m
//  sqlite_test
//
//  Created by sharingmobile on 2018/2/12.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import <Masonry.h>

static sqlite3 * db;

@interface ViewController ()

@property(nonatomic,strong)UIButton * open;
@property(nonatomic,strong)UIButton * createTable;
@property(nonatomic,strong)UIButton * insertData;
@property(nonatomic,strong)UIButton * delete;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor redColor]];
    
    [self initFrame];
    
}

-(void)initFrame{
    [self.view addSubview:self.open];
    [self.view addSubview:self.createTable];
    [self.view addSubview:self.insertData];
    [self.view addSubview:self.delete];
    
    [self.open mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view).offset(50);
    }];
    [self.createTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.open.mas_bottom).offset(20);
    }];
    [self.insertData mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.createTable.mas_bottom).offset(30);
    }];
    [self.delete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.insertData.mas_bottom).offset(30);
    }];
    
}



#pragma mark - method

-(void) openSqlite{
    if (db != nil) {
        NSLog(@"数据库已经打开");
        return;
    }
    
    //获取文件路径
    NSArray * array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"array.count = %ld ",array.count);
    NSString * domainPath = [array firstObject];
    NSString * sqliteName = [domainPath stringByAppendingPathComponent:@"my.sqlite"];
    NSLog(@"domainPath = %@",domainPath);
    //如果数据库 存在就打开，如果不存在 就创建一个 再打开
    int result = sqlite3_open([sqliteName UTF8String],&db);
    if (result == SQLITE_OK) {
        NSLog(@"数据库打开成功");
    }else{
        NSLog(@"数据库打开失败");
    }
}

-(void)createTab{
    //sql 语句
//    NSString *sqlite = [NSString stringWithFormat:@"create table if not exists 'student' ('number' integer primary key autoincrement not null,'name' text,'sex' text,'age'integer)"];
    NSString * createTable = [NSString stringWithFormat:@"create table if not exists 'student'('id' integer primary key autoincrement not null , 'name' text,'sex' text ,'age' integer)"];
    //执行sql 语句
    //如果执行sql语句出错了 就用error 保存错误信息
    char * error = NULL;
    int result = sqlite3_exec(db, [createTable UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"创建表格成功");
    }else{
        NSLog(@"创建表格失败");
    }
}

-(void)insertD{
    NSString * insert = [NSString stringWithFormat:@"insert into student(id,name,sex,age) values ('%d','%@','%@','%d')",1,@"张三",@"男",23];
    //执行sql语句
    char * error = NULL;
    int result = sqlite3_exec(db, [insert UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"添加数据成功");
    }else{
        NSLog(@"添加数据失败");
    }
}

-(void)deleteD{
    NSString * delete = [NSString stringWithFormat:@"delete from student where number = '%d'",1];
    char * error = NULL;
    int result = sqlite3_exec(db, [delete UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"删除数据成功");
    }else{
        NSLog(@"删除数据失败 %s",error);
    }
}

#pragma mark - action

-(void)openClicked{
    [self openSqlite];
}

-(void)createTableClicked{
    [self createTab];
}

-(void)insertDataClicked{
    [self insertD];
}

-(void)deleteClicked{
    [self deleteD];
}

#pragma mark - lazyload

-(UIButton *)open{
    if (_open == nil) {
        _open = [[UIButton alloc] init];
        [_open setTitle:@"打开数据库" forState:UIControlStateNormal];
        [_open setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_open setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_open setBackgroundColor:[UIColor lightGrayColor]];
        [_open addTarget:self action:@selector(openClicked) forControlEvents:UIControlEventTouchUpInside];
        [_open sizeToFit];
    }
    return _open;
}

-(UIButton *)createTable{
    if (_createTable == nil) {
        _createTable = [[UIButton alloc] init];
        [_createTable setTitle:@"创建表格" forState:UIControlStateNormal];
        [_createTable setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_createTable setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_createTable setBackgroundColor:[UIColor lightGrayColor]];
        [_createTable addTarget:self action:@selector(createTableClicked) forControlEvents:UIControlEventTouchUpInside];
        [_createTable sizeToFit];
    }
    return _createTable;
}

-(UIButton *)insertData{
    if (_insertData == nil) {
        _insertData = [[UIButton alloc] init];
        [_insertData setTitle:@"插入数据" forState:UIControlStateNormal];
        [_insertData setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_insertData setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_insertData setBackgroundColor:[UIColor lightGrayColor]];
        [_insertData addTarget:self action:@selector(insertDataClicked) forControlEvents:UIControlEventTouchUpInside];
        [_insertData sizeToFit];
    }
    return _insertData;
}

-(UIButton *)delete{
    if (_delete == nil) {
        _delete = [[UIButton alloc] init];
        [_delete setTitle:@"删除数据" forState:UIControlStateNormal];
        [_delete setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_delete setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_delete setBackgroundColor:[UIColor lightGrayColor]];
        [_delete addTarget:self action:@selector(deleteClicked) forControlEvents:UIControlEventTouchUpInside];
        [_delete sizeToFit];
    }
    return _delete;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
