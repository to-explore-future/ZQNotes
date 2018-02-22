//
//  MQTTManager.m
//  MQTTDemo
//
//  Created by sharingmobile on 2018/2/14.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "MQTTManager.h"
#import <MQTTKit.h>

static NSString * Khost = @"127.0.0.1";
static const uint16_t Kport = 6969;
static NSString * KClientID = @"ZQ";


@interface MQTTManager (){
    MQTTClient * client;
}

@end

@implementation MQTTManager

+(instancetype)share{
    static dispatch_once_t onceToken;
    static MQTTManager * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(void)initSocket{
    if (client) {
        [self disConnect];
    }
    
    client = [[MQTTClient alloc] initWithClientId:KClientID];
    client.port = Kport;
    
    //收到消息的回调 前提是 先订阅消息
    [client setMessageHandler:^(MQTTMessage *message) {
        NSString * msg = [[NSString alloc] initWithData:message.payload encoding:NSUTF8StringEncoding];
        NSLog(@"收到服务端的消息：%@",msg);
    }];
    
    //连接到host 的回调
    /*
     ConnectionAccepted,
     ConnectionRefusedUnacceptableProtocolVersion,
     ConnectionRefusedIdentiferRejected,
     ConnectionRefusedServerUnavailable,
     ConnectionRefusedBadUserNameOrPassword,
     ConnectionRefusedNotAuthorized
     */
    [client connectToHost:Khost completionHandler:^(MQTTConnectionReturnCode code) {
        //根据连接到host 的不同的状态 返回不同的 code
        switch (code) {
            case ConnectionAccepted://连接成功
                NSLog(@"MQTT连接成功");
                break;
            case ConnectionRefusedBadUserNameOrPassword://不匹配的用户名和密码
                NSLog(@"用户名 密码 不匹配");
                break;
//            case ConnectionRefusedUnacceptableProtocolVersion://什么版本不对
//                break;
//            case ConnectionRefusedIdentiferRejected://??
//                break;
//            case ConnectionRefusedServerUnavailable://服务器不可用
//                break;
//            case ConnectionRefusedNotAuthorized://
//                break;
                
            default://不写的情况一致认为是连接失败
                NSLog(@"MQTT连接失败");
                break;
        }
    }];
}

#pragma mark - 对外的一些接口


-(void)connect{
    [self initSocket];
}

-(void)disConnect{
    if (client) {
        [client unsubscribe:client.clientID withCompletionHandler:^{
            NSLog(@"取消订阅成功");
        }];
        [client disconnectWithCompletionHandler:^(NSUInteger code) {
            NSLog(@"取消连接成功");
        }];
    }
}

-(void)sendMsg:(NSString *)msg{
    [client publishString:msg toTopic:KClientID withQos:ExactlyOnce retain:YES completionHandler:^(int mid) {
        //发送之后 回调一个mid 我想找个可能是 表示发送的结果
        NSLog(@"发送结果 ：mid = %d",mid);
    }];
}


@end
