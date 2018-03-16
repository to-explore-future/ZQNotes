//
//  ViewController.m
//  水波纹按钮练习
//
//  Created by sharingmobile on 2018/3/7.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "ViewController.h"
#import "FingerWaveView.h"

@interface ViewController ()

@property(nonatomic,strong)FingerWaveView * waveView;
@property(nonatomic,strong)UIButton * button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor lightGrayColor]];

    self.button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.button setTitle:@"测试" forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor grayColor]];
    [self.button setTintColor:[UIColor redColor]];
    
    UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPressGesture.minimumPressDuration = 0.5;
    [self.button addGestureRecognizer:longPressGesture];
    
    [self.view addSubview:self.button];
}


-(void)longPressAction:(UILongPressGestureRecognizer *) gesture{
    
    NSLog(@"longpressAction");
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按开始");
        CGPoint center = CGPointMake(self.button.frame.origin.x + self.button.frame.size.width / 2, self.button.frame.origin.y + self.button.frame.size.height / 2);
        self.waveView = [FingerWaveView showInView:self.view center:center];
        
    }else if (gesture.state == UIGestureRecognizerStateEnded){
        NSLog(@"长按结束");
        NSLog(@"移除所有的 sublayer");
        [self.waveView removeAllSubLayter];
        [self.waveView removeFromSuperview];
    }
    else {
        NSLog(@"长按中");
       
    }

//    CGPoint center = CGPointMake(self.button.frame.origin.x + self.button.frame.size.width / 2, self.button.frame.origin.y + self.button.frame.size.height / 2);
//    self.waveView = [FingerWaveView showInView:self.view center:center];
//    NSLog(@"long press");
}


//-(void)downAction:(UIButton*)btn{
//    CGPoint center = CGPointMake(btn.frame.origin.x + btn.frame.size.width / 2, btn.frame.origin.y + btn.frame.size.height / 2);
//    self.waveView = [FingerWaveView showInView:self.view center:center];
//    NSLog(@"down action");
//}

-(void)upAction:(UIButton*)btn{
    NSLog(@"移除所有的 sublayer");
    [self.waveView removeAllSubLayter];
    self.waveView = nil;
}

-(void)TapAction{
    NSLog(@"移除所有的 sublayer");
    [self.waveView removeAllSubLayter];
    self.waveView = nil;
}

//-(void)onTap:(UITapGestureRecognizer*)sender{
//    CGPoint center = [sender locationInView:sender.view];
//    [FingerWaveView showInView:self.view center:center];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
