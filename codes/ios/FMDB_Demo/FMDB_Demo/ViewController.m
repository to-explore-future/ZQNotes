//
//  ViewController.m
//  FMDB_Demo
//
//  Created by sharingmobile on 2018/2/12.
//

#import "ViewController.h"
#import "FMDatabase.h"

@interface ViewController ()

@property(nonatomic,strong)NSString     * docPath;//沙盒地址(数据库地址)
@property(nonatomic,strong)FMDatabase   * db;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.获取文件的路径-这个是沙盒路径 数据库放置 的位置 ，什么沙盒不沙盒的 ，其实就是 苹果 指定一个一个位置，应用的
    //数据指定放到指定的位置，就像是Android也有指定防止的位置。
    //模拟器的沙盒路劲和真机的沙盒路径是不同，模拟器使用的mac 的存储，
    _docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",_docPath);
    
    //设置数据库的名称
    NSString * fileName = [_docPath stringByAppendingPathComponent:@"student.sqlite"];
    _db = [FMDatabase databaseWithPath:fileName];
    if ([_db open]) {
        NSLog(@"打开数据库成功");
    }else{
        NSLog(@"打开数据库失败");
    }

}

#pragma mark - method

- (IBAction)createDatebase:(UIButton *)sender {
    NSString * fileName = [_docPath stringByAppendingPathComponent:@"student.sqlite"];
    _db = [FMDatabase databaseWithPath:fileName];
    if ([_db open]) {
        NSLog(@"打开数据库成功");
    }else{
        NSLog(@"打开数据库失败");
    }
}

- (IBAction)createTable:(UIButton *)sender {
    
}

- (IBAction)addDate:(UIButton *)sender {
}

- (IBAction)deleteDate:(UIButton *)sender {
}

- (IBAction)updateDate:(UIButton *)sender {
}

- (IBAction)queryDate:(UIButton *)sender {
}

- (IBAction)deleteTable:(UIButton *)sender {
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
