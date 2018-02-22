//
//  ViewController.m
//  WebSocketDemo
//
//  Created by sharingmobile on 2018/2/13.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "ViewController.h"
#import "WebSocketManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *message;
@property(nonatomic,strong) WebSocketManager * manager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = [WebSocketManager share];
    
}
- (IBAction)sendMessage:(UIButton *)sender {
    [self.manager sendMsg:self.message.text];
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
