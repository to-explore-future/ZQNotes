//
//  TYHSocketManager.m
//  YYSocketDemo
//
//  Created by sharingmobile on 2018/2/13.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//  http://www.cocoachina.com/ios/20170110/18544.html
//  网址中的第一个案例  js代码 照着敲

#import "TYHSocketManager.h"
#import <sys/types.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface TYHSocketManager ()

@property(nonatomic,assign)int clientSocket;

@end

@implementation TYHSocketManager

+(instancetype)share{
    static dispatch_once_t onceToken;
    static TYHSocketManager * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        [instance initSocket];
//        [instance pullMsg];
    });
    return instance;
}

-(void)initSocket{
    //每次连接前，先断开连接
    if (_clientSocket != 0) {
        [self disConnect];
        _clientSocket = 0;
    }
    
    //创建客户端socket
    _clientSocket = createClientSocket();
    
    //服务器ip
    const char * server_ip = "127.0.0.1";
    //服务器端口
    short server_port = 6969;
    
    //连接服务器
    if (connetToServer(_clientSocket,server_ip,server_port) == 0) {
        printf("Connect to server error \n ");
        return;
    }
    printf("Connect to server ok \n");
}

//创建一个socket
static int createClientSocket(){
    int clientSocket = 0;
    //创建一个socket,返回值类型为 Int
    //第一个参数 addressFamily IPv4(AF_INET) 或 IPv6(AF_INET6)
    //第二个参数 type 表示 socket类型 ，通常是流 stream(SOCK_STREAM) 或 数据报文 datagram(SOCK_DGRAM)
    clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    return clientSocket;
}

//连接服务器
static int connetToServer(int client_socket,const char * server_ip,unsigned short port){
    //生成一个sockaddr_in 类型的结构体
    struct sockaddr_in sAddr = {0};
    sAddr.sin_len = sizeof(sAddr);
    //设置IPv4
    sAddr.sin_family = AF_INET;
    
    //inet_aton是一个改进的方法来将一个字符串IP地址，转换为一个32位的网络序列IP
    //如果这个函数成功，函数的返回值非零，如果输入的地址不正确则会返回零。
    inet_aton(server_ip, &sAddr.sin_addr);
    
    //htons是将整形变量 从主机字节顺序 转变成网络字节顺序，赋值端口号
    sAddr.sin_port = htons(port);
    
    //用socket和服务端地址，发起连接
    //客户端像特定网络地址的服务器发送连接请求，连接成功返回0，失败返回-1
    //注意改接口调用会阻塞当前线程，知道服务器返回。
    if (connect(client_socket, (struct sockaddr *)&sAddr, sizeof(sAddr)) == 0) {
        return client_socket;
    }
    return 0;
}

#pragma mark - 新线程来接受消息

-(void)pullMsg{
    NSThread * thread = [[NSThread alloc] initWithTarget:self selector:@selector(receiveAction) object:nil];
    [thread start];
}

#pragma mark - 对外逻辑

//连接
-(void)connect{
    [self initSocket];
}

//断开连接
-(void)disConnect{
    close(self.clientSocket);
}

//发消息
-(void)sendMsg:(NSString *)msg{
    const char * send_Message = [msg UTF8String];
    send(self.clientSocket,send_Message,strlen(send_Message)+1,0);
}

//收取服务端发送的消息
-(void)receiveAction{
    while (1) {
        char receive_Message[1024] = {0};
        recv(self.clientSocket, receive_Message, sizeof(receive_Message), 0);
        printf("%s\n",receive_Message);
    }
}



@end
