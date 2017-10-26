//
//  ViewController.m
//  TabView
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"通讯录";
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _data = [[NSMutableArray alloc] init];
    
    for (char c = 'A'; c <= 'Z'; c++) {
        NSMutableArray * sa = [[NSMutableArray alloc]init];
        
        for (int x = 0 ; x < 5 ; x++) {
            NSString *str = [NSString stringWithFormat:@"%c-%d",c,x];
            [sa addObject:str];
        }
        [_data addObject:sa];
    }
    
    
    [self.view addSubview:_tableView];
    
    
    [self creatBtns];
    
    self.navigationItem.rightBarButtonItem = _edit;
    
    
    
}

- (void) creatBtns{
    _edit = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
    
    _done = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    _delete = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(delete)];
    
    
}

- (void)edit{
    NSLog(@"");
    [_tableView setEditing:YES];
    self.navigationItem.rightBarButtonItem = _done;
}
- (void)done{
    NSLog(@"");
    [_tableView setEditing:NO];
    self.navigationItem.rightBarButtonItem = _edit;
}
- (void)delete{
    NSLog(@"");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_data objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cell = @"cell";
    //使用标识符 列出 可以重新使用的 cell
    /*
     这个过程 就和Android 的listView是一个道理 cell划过屏幕， 就可以被重用，
     */
    UITableViewCell *tc = [_tableView dequeueReusableCellWithIdentifier:cell];
    if (tc == nil) {
        tc = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell];
    }
    
    NSString * str = nil;/*[NSString stringWithFormat:@"第%li组，第%li行",indexPath.section,indexPath.row];*/
//    str = [[_data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    str = _data[indexPath.section][indexPath.row];
    
    tc.textLabel.text = str;
    tc.detailTextLabel.text = @"副标题";
    NSString * name = @"icon.png";
    UIImage * image = [UIImage imageNamed:name];
    tc.imageView.image = image;
    return tc;
}

//编辑状态样式
/*
 选择状态：UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert
 
 */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete ;
}

//删除数据

//重写这个方法-->响应滑动手势，向左滑动，显示出 删除按钮，
//点击删除按钮-->回调这个方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    [_data removeObject:_data[indexPath.section][indexPath.row] ];
    [_data[indexPath.section] removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"这是脚部";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"这是头部";
}

//选中了哪里
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了第%dsecton,第%drow",indexPath.section,indexPath.row);
}

//取消选中哪里
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"取消-----选中----第-%d-secton,第-%d-row",indexPath.section,indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
