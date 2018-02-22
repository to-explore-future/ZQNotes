//
//  WebSocketManager.m
//  WebSocketDemo
//
//  Created by sharingmobile on 2018/2/13.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//  CocoaAsyncSocket

#import "WebSocketManager.h"
#import "GCDAsyncSocket.h"

static NSString * Khost = @"127.0.0.1";
static const uint16_t Kport = 6969;

@interface WebSocketManager ()<GCDAsyncSocketDelegate>{
    GCDAsyncSocket * gcdSocket;
}

@end

@implementation WebSocketManager

+(instancetype)share{
    static dispatch_once_t onceToken;
    static WebSocketManager * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        [instance initSocket];
    });
    return instance;
}

-(void)initSocket{
    gcdSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
}

#pragma mark - 对外的一些接口

//建立连接
-(BOOL)connect{
    return [gcdSocket connectToHost:Khost onPort:Kport error:nil];
}

//断开连接
-(void)disConnect{
    [gcdSocket disconnect];
}

//发送消息
-(void)sendMsg:(NSString *)msg{
    NSData * data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    [gcdSocket writeData:data withTimeout:-1 tag:110];
}

//监听最新的消息
-(void)pullMsg{
    //监听数据的代理， -1 永远监听 ，但是只接收一次消息
    //
    [gcdSocket readDataWithTimeout:-1 tag:110];
}

#pragma mark - GCDAsyncSocketDelegate

//连接成功调用
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    NSLog(@"连接成功，host = %@,port = %d ",host ,port);
    //连接成功之后 开启接收消息监听
    [self pullMsg];
    
    //连接成功之后呢 就要建立心跳机制
    
}

//断开链接的时候调用
-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{
    NSLog(@"断开连接,host = %@ ,port = %d",sock.localHost,sock.localPort);
    
    //断开连接之后 就会回调这里  断线重连的代码写在这里
    // <# 断线重连 #>
    
}

//socket成功写数据成功：其实就是发送消息成功
-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"socket 写入数据成功");
}

//收到消息的回调
-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSString * msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"收到消息:%@",msg);
    //由于收消息的监听 收一次消息就会失效 所以这里 每次收到消息 都要再次开启 消息监听
    [self pullMsg];
}

//分段去获取消息的回调
//- (void)socket:(GCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
//{
//
//    NSLog(@"读的回调,length:%ld,tag:%ld",partialLength,tag);
//
//}


//为上一次设置的读取数据代理续时 (如果设置超时为-1，则永远不会调用到)
//-(NSTimeInterval)socket:(GCDAsyncSocket *)sock shouldTimeoutReadWithTag:(long)tag elapsed:(NSTimeInterval)elapsed bytesDone:(NSUInteger)length
//{
//    NSLog(@"来延时，tag:%ld,elapsed:%f,length:%ld",tag,elapsed,length);
//    return 10;
//}


@end


















