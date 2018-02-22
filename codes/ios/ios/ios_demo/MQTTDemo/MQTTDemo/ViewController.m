//
//  ViewController.m
//  MQTTDemo
//
//  Created by sharingmobile on 2018/2/14.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "ViewController.h"
#import "MQTTManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *msg;
@property(nonatomic,strong) MQTTManager * manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = [MQTTManager share];
}

- (IBAction)send:(UIButton *)sender {
    [self.manager sendMsg:self.msg.text];
}
- (IBAction)connect:(UIButton *)sender {
    [self.manager connect];
}
- (IBAction)disConnect:(UIButton *)sender {
    [self.manager disConnect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
