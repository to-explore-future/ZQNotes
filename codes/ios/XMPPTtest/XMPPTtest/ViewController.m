//
//  ViewController.m
//  XMPPTtest
//
//  Created by sharingmobile on 2018/2/22.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)XMPPStream * xmppStream;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化通信通道
    self.xmppStream = [[XMPPStream alloc] init];
    //给通信通道设置服务器ip地址
//    self.xmppSteam.hostName = KHostName;
    //给通讯通道设置代理
    [self.xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    if (![self.xmppStream isConnected]) {
//        NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        XMPPJID *jid = [XMPPJID jidWithUser:@"13810835555" domain:@"" resource:@"123"];
        [self.xmppStream setMyJID:jid];
        [self.xmppStream setHostName:@"10.4.125.113"];
        NSError *error = nil;
        if(![self.xmppStream connectWithTimeout:10 error:&error]){
            NSLog(@"连接失败 :error = %@",[[error userInfo] description]);
        }
        NSLog(@"什么情况");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
