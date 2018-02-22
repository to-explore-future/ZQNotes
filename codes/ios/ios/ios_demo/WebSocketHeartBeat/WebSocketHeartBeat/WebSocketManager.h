//
//  WebSocketManager.h
//  WebSocketHeartBeat
//
//  Created by sharingmobile on 2018/2/14.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger{
    disConnectByUser,
    disConnectByServer,
} DisConnectType;

@interface WebSocketManager : NSObject

+(instancetype)share;

-(void)connect;
-(void)disConnect;

-(void)sendMsg:(NSString *)msg;

-(void)ping;

@end
