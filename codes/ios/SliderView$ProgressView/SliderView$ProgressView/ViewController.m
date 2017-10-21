//
//  ViewController.m
//  SliderView$ProgressView
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


//构造方法  与 成员变量的同步，关联
@synthesize pView = _progressView;
@synthesize slider = _slider;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self aboutProgress];
    
    [self aboutSlider];
    
    
    
}
//进度条
-(void)aboutProgress{
    _progressView = [[UIProgressView alloc] init];
    //UIProgress 的进度条的高度是写死的
    _progressView.frame = CGRectMake(10, 100, 300, 50);
    
    //设置风格颜色值
    _progressView.progressTintColor = [UIColor orangeColor];
    //轨道颜色
    _progressView.trackTintColor = [UIColor purpleColor];
    
    //设置进度条的风格
    _progressView.progressViewStyle =UIProgressViewStyleDefault;
    
    //进度
    _progressView.progress = 0.5;
    
    [self.view addSubview:_progressView];
}

//滑动条
-(void )aboutSlider{
    _slider = [[UISlider alloc] init];
    //UISlider控件的 高度不可改变
    _slider.frame = CGRectMake(10, 200, 300, 50);
    _slider.minimumValue = 0;
    _slider.maximumValue = 100;
    _slider.minimumTrackTintColor = [UIColor orangeColor];
    _slider.maximumTrackTintColor = [UIColor purpleColor];
    _slider.thumbTintColor = [UIColor orangeColor];
    
    _slider.value = 50;
    [self.view addSubview:_slider];
    
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
}

- (void)pressSlider{
    //如果 控制条的最小值为负数 就要使用这种方式
    _progressView.progress =  (_slider.value - _slider.minimumValue) / (_slider.maximumValue - _slider.minimumValue);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
