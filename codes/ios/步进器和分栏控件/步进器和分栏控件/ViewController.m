//
//  ViewController.m
//  步进器和分栏控件
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize stepper = _stepper;
@synthesize segmentControl = _segControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self aboutStepper];
    [self aboutSegment];
}

//分栏
- (void)aboutSegment{
    _segControl = [[UISegmentedControl alloc] init];
    _segControl.frame = CGRectMake(10, 300, 300, 40);
    [_segControl insertSegmentWithTitle:@"8元" atIndex:0 animated:YES];
    [_segControl insertSegmentWithTitle:@"16元" atIndex:1 animated:YES];
    [_segControl insertSegmentWithTitle:@"32元" atIndex:2 animated:YES];
    [_segControl insertSegmentWithTitle:@"50元" atIndex:3 animated:YES];
    
    _segControl.selectedSegmentIndex = 0;
    
    [_segControl addTarget:self action:@selector(segPressed) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_segControl];
}

- (void)segPressed{
    NSLog(@"%zi",_segControl.selectedSegmentIndex);
}

- (void) aboutStepper{
    _stepper = [[UIStepper alloc] init];
    //  步进器不支持更高宽高
    _stepper.frame = CGRectMake(100, 100, 300, 200);
    _stepper.minimumValue = 0;
    _stepper.maximumValue = 100;
    _stepper.value = 50;
    _stepper.stepValue = 5;
    
    //press & hold value auto repeat,按住的时候值 会自动增长或者减少
    _stepper.autorepeat = NO;
    // 在 autorepeat 为Yes 的前提下，按住不放是否连续调用响应函数
    //如果是连续调用 每一次步进值的改变 都会调用 响应函数
    //如果不是：步进值也在发生改变但是 ，只有在 手势结束后 才调用一次 响应函数
    _stepper.continuous = YES;
    
    [_stepper addTarget:self action:@selector(step) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_stepper];
}

- (void) step{
    NSLog(@"步进了,value= %f",_stepper.value);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
