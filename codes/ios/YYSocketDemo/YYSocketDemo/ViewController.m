//
//  ViewController.m
//  YYSocketDemo
//
//  Created by sharingmobile on 2018/2/13.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "ViewController.h"
#import "TYHSocketManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *message;
@property(nonatomic,strong) TYHSocketManager * manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = [TYHSocketManager share];
    //开启新的线程 接收消息
//    [self.manager pullMsg];
    
}

- (IBAction)send:(UIButton *)sender {
    [self.manager sendMsg:self.message.text];
}

- (IBAction)connect:(UIButton *)sender {
    [self.manager connect];
}

- (IBAction)disConnet:(UIButton *)sender {
    [self.manager disConnect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
