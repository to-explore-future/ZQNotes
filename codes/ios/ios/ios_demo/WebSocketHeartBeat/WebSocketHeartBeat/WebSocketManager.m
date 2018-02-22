//
//  WebSocketManager.m
//  WebSocketHeartBeat
//
//  Created by sharingmobile on 2018/2/14.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "WebSocketManager.h"
#import "SocketRocket.h"

#define dispatch_main_async_safe(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }

static NSString * Khost = @"127.0.0.1";
static const uint16_t Kport = 6969;

@interface WebSocketManager ()<SRWebSocketDelegate>{
    SRWebSocket * webSocket;
    NSTimer * heartbBeat;
    NSTimeInterval reConnectTime;
}

@end

@implementation WebSocketManager

+(instancetype)share{
    static dispatch_once_t onceTocken;
    static WebSocketManager * instance = nil;
    dispatch_once(&onceTocken, ^{
        instance = [[self alloc] init];
        [instance initSocket];
    });
    return instance;
}

-(void)initSocket{
    if (webSocket) {
        return;
    }
    
    webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"ws://%@:%d",Khost,Kport]]];
    webSocket.delegate = self;
    
    //设置代理线程 queue
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 1;
    
    [webSocket setDelegateOperationQueue:queue];
    
    //连接
    [webSocket open];
}

//初始化心跳包
//为什么要心跳
//地球上的 设备 太多了 ipv4 明显不够用了 一个真正的IP 通过路由连接了 好多的设备
//每个路由后面的设备 使用的是 局域IP地址， 像这种情况 ip 服务商如果发现 某个基于ip
//长时间没有连接（5分钟）就会让这种 ip 后面的ip失效.所有这里的心跳机制恰是就是
//为了解决这种问题。
-(void)initHeartBeat{
    dispatch_main_async_safe(^{
        [self destoryHeartBeat];
        
        __weak typeof(self) weakSelf = self;
        heartbBeat = [NSTimer scheduledTimerWithTimeInterval:1*60 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"heart");
            [weakSelf sendMsg:@"heart"];
        }];
        [[NSRunLoop currentRunLoop] addTimer:heartbBeat forMode:NSRunLoopCommonModes];
    })
}

//取消心跳
-(void)destoryHeartBeat{
    dispatch_main_async_safe(^{
        if (heartbBeat) {
            [heartbBeat invalidate];
            heartbBeat = nil;
        }
    })
}

#pragma mark - 对外的一些接口

-(void)connect{
    [self initSocket];
    reConnectTime = 0;
}

-(void)disConnect{
    if (webSocket) {
        [webSocket close];
        webSocket = nil;
    }
}

-(void)sendMsg:(NSString *)msg{
    [webSocket send:msg];
}

//重连接机制
-(void)reConnect{
    [self disConnect];
    
    //超过一分钟就不会重连 所以只会重连5次 2^5 =
    if (reConnectTime > 64) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(reConnectTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        webSocket = nil;
        [self initSocket];
     });
    
    if (reConnectTime == 0) {
        reConnectTime = 2;
    }else{
        reConnectTime *= 2;
    }
}

//pingpong
-(void)ping{
    if (webSocket) {
        [webSocket sendPing:nil];
    }
}

#pragma mark - SRWebsocketDelegate

-(void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message{
    NSLog(@"收到服务器的消息:%@",message);
}

-(void)webSocketDidOpen:(SRWebSocket *)webSocket{
    NSLog(@"连接成功");
    //连接成功之后呢 就要就开始心跳机制
    [self initHeartBeat];
}

-(void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
    NSLog(@"网络关闭,code = %ld,reason = %@ ,wasClean = %d",code,reason,wasClean);
    if (code == disConnectByUser) {
        [self disConnect];
    }else{//除了用户自己断开连接 其余情况都要主动重连
        [self reConnect];
    }
    // 断开连接时销毁心跳包
    [self destoryHeartBeat];
}

-(void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload{
    NSLog(@"收到 pong 回调");
}

@end
