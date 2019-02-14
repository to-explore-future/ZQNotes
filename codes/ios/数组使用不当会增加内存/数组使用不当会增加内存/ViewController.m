//
//  ViewController.m
//  数组使用不当会增加内存
//
//  Created by haoqiao on 2019/2/12.
//  Copyright © 2019 zq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIButton * reInitArrays;
@property(nonatomic,strong)UIButton * multableCopyButton;
@property(nonatomic,strong)UIButton * nextVC;

@property(nonatomic,strong)NSMutableArray * array1;
@property(nonatomic,strong)NSMutableArray * array2;
@property(nonatomic,strong)NSMutableArray * array3;
@property(nonatomic,strong)NSMutableArray * array4;
@property(nonatomic,strong)NSMutableArray * array5;
@property(nonatomic,strong)NSMutableArray * array6;

@property(nonatomic,strong)NSMutableArray * arr1;
@property(nonatomic,strong)NSMutableArray * arr2;
@property(nonatomic,strong)NSMutableArray * arr3;
@property(nonatomic,strong)NSMutableArray * arr4;
@property(nonatomic,strong)NSMutableArray * arr5;
@property(nonatomic,strong)NSMutableArray * arr6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self initView];
}

- (void) initView{
    [self.view addSubview:self.reInitArrays];
    [self.view addSubview:self.multableCopyButton];
}

- (void) initData{
    _array1 = [NSMutableArray arrayWithObjects:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon1"]], nil];
    _array2 = [NSMutableArray arrayWithObjects:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon2"]], nil];
    _array3 = [NSMutableArray arrayWithObjects:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon3"]], nil];
    _array4 = [NSMutableArray arrayWithObjects:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon4"]], nil];
    _array5 = [NSMutableArray arrayWithObjects:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon5"]], nil];
    _array6 = [NSMutableArray arrayWithObjects:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon6"]], nil];
}

- (void)reInitArraysAction:(UIButton *)sender {
    [self initData];
    NSLog(@"被点击了");
}

- (void) multableCopyButtonAction:(UIButton *) sender{
    self.arr1 = self.array1.mutableCopy;
    self.arr2 = self.array2.mutableCopy;
    self.arr3 = self.array3.mutableCopy;
    self.arr4 = self.array4.mutableCopy;
    self.arr5 = self.array5.mutableCopy;
    self.arr6 = self.array6.mutableCopy;
    NSLog(@"被点击了");
}

- (void)nextVCAction:(UIButton *)sender {
    
    NSLog(@"被点击了");
}


- (UIButton *) reInitArrays{
    if (!_reInitArrays) {
        _reInitArrays = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 40)];
        [_reInitArrays setTitle:@"重新初始化数组" forState:UIControlStateNormal];
        [_reInitArrays setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_reInitArrays setBackgroundColor:[UIColor greenColor]];
        [_reInitArrays addTarget:self action:@selector(reInitArraysAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reInitArrays;
}

- (UIButton *) multableCopyButton{
    if (!_multableCopyButton) {
        _multableCopyButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 40)];
        [_multableCopyButton setTitle:@"深拷贝数组" forState:UIControlStateNormal];
        [_multableCopyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_multableCopyButton setBackgroundColor:[UIColor greenColor]];
        [_multableCopyButton addTarget:self action:@selector(multableCopyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _multableCopyButton;
}

- (UIButton *)nextVC{
    if (!_nextVC) {
        _nextVC = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
        [_nextVC setTitle:@"下一个页面" forState:UIControlStateNormal];
        [_nextVC setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_nextVC setBackgroundColor:[UIColor greenColor]];
        [_nextVC addTarget:self action:@selector(nextVCAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextVC;
}


@end
