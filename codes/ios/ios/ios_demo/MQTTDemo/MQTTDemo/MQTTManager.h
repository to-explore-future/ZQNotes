//
//  MQTTManager.h
//  MQTTDemo
//
//  Created by sharingmobile on 2018/2/14.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MQTTManager : NSObject

+(instancetype)share;

-(void)connect;
-(void)disConnect;

-(void)sendMsg:(NSString *)msg;

@end
