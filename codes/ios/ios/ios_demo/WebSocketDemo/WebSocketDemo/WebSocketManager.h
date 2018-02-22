//
//  WebSocketManager.h
//  WebSocketDemo
//
//  Created by sharingmobile on 2018/2/13.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebSocketManager : NSObject

+(instancetype)share;
-(BOOL)connect;
-(void)disConnect;

-(void)sendMsg:(NSString*)msg;
-(void)pullMsg;

@end
