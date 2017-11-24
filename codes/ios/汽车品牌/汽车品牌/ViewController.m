//
//  ViewController.m
//  汽车品牌
//
//  Created by to-explore-future on 17/11/22.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"

@interface ViewController ()<UITableViewDelegate,UIAlertViewDelegate>

@property(nonatomic,strong)             NSMutableArray  * array;
@property (weak, nonatomic) IBOutlet    UITableView     * tableView;
@property(nonatomic,assign)             NSIndexPath     * indexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initData];
    //-------------------------------------设置行高-------------------------------------
    //这种方法用来 统一给tableVeiw 中的所有row设置高度，是一起设置 而不是一个一个的设置，这种方法效率高
    self.tableView.rowHeight = 100;
    //-------------------------------------设置行高-------------------------------------
    
    //-------------------------------------设置分割线的颜色-------------------------------------
    self.tableView.separatorColor = [UIColor redColor];
    //-------------------------------------设置分割线的颜色-------------------------------------
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSMutableArray *)array{
    if (_array == nil) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"continent.plist" ofType:nil];
        NSArray * array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * mutableArray = [NSMutableArray array];
        for (NSDictionary * dic in array) {
            CellModel * model = [CellModel goupWithDic:dic];
            [mutableArray addObject:model];
        }
        _array = mutableArray;
    }
    return _array;
}

- (void)initData{
    //从 plist 文件中加载数据
    NSString * path = [[NSBundle mainBundle] pathForResource:@"continent.plist" ofType:nil];
    NSArray * array = [NSArray arrayWithContentsOfFile:path];
    self.array = [NSMutableArray array];
    for (NSDictionary * dic in array) {
        CellModel * model = [CellModel goupWithDic:dic];
        [self.array addObject:model];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CellModel *model = self.array[section];
    return model.countries.count;
}

//系统会每一个section 每一个row的回调这个方法，你只需要根据系统给的indexpath巧妙的赋值即可
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//------------------------------------设置单元格的重用----------------------------------
//   UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    NSString * reuseID = @"reuseID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        NSLog(@"=================");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    
//------------------------------------设置单元格的重用----------------------------------
    
    CellModel * model =  self.array[indexPath.section];
    cell.textLabel.text = model.countries[indexPath.row];
    cell.detailTextLabel.text = @"详细描述" ;
    cell.imageView.image = [UIImage imageNamed:@"gold_32"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//------------------------------------设置背景颜色----------------------------------
//    if (indexPath.row % 2 == 0) {
//        cell.backgroundColor = [UIColor purpleColor];
//    }else{
//        cell.backgroundColor = [UIColor redColor];
//    }
//    cell.accessoryView = [[UISwitch alloc] init];
//
//    //设置选中的背景的颜色
//    UIView * bgView = [[UIView alloc]init];
//    bgView.backgroundColor = [UIColor greenColor];
//    cell.selectedBackgroundView = bgView;
//------------------------------------设置背景颜色----------------------------------
    

    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CellModel * model = self.array[section];
    NSString * header = model.series;
    return header;
}

-(NSString * )tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CellModel * model = self.array[section];
    NSString * footer = model.continentDescription;
    return footer;
}

#pragma mark - 设置行高

/**
 *  从运行结果来看 ，程序优先执行了 统一设置的方法，说明这个方法是 落后与viewDidLoad（）执行的
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        return 100;
    }else{
        return 60;
    }
}

#pragma mark - 设置选中行

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"第%ld组第%ld 行",indexPath.section,indexPath.row);
    //每当我选中一行的时候 弹出一个对话框
    //message 显示选中的 item 的 title
    CellModel *model =  self.array[indexPath.section];
    NSString * title = model.countries[indexPath.row];
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:title delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert textFieldAtIndex:0].text = title;
    self.indexPath = indexPath;
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //这个是 cancel
    }else if(buttonIndex == 1){
        //这个是 ok 这是时候把数据源也修改
        NSString * temp = [alertView textFieldAtIndex:0].text;
        CellModel * model =  self.array[self.indexPath.section];
        NSMutableArray * arr = model.countries;
//        [arr replaceObjectAtIndex:self.indexPath.row withObject:temp];
        
        NSMutableArray * newArr = [NSMutableArray arrayWithArray:arr];
        [newArr replaceObjectAtIndex:self.indexPath.row withObject:temp];
        model.countries = nil;
        model.countries = newArr;

        //修改之后 刷新数据
        // 简单粗暴 没效率 的方法
//        [self.tableView reloadData];
//        NSLog(@"=====================:%@",@[self.indexPath]);
        //改哪里 就刷新哪里
        //改那个对象 就刷新那个对象，传一个你改的对象  @[self.indexPath] 就是指向的对像的地址
        [self.tableView reloadRowsAtIndexPaths:@[self.indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}





@end
