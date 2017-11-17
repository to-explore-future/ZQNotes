//
//  ButtonFrameWithTag.h
//  猜图游戏
//
//  Created by to-explore-future on 17/11/16.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ButtonFrameWithTag : NSObject

@property(nonatomic,assign)float x;
@property(nonatomic,assign)float y;
@property(nonatomic,assign)float width;
@property(nonatomic,assign)float height;

-(ButtonFrameWithTag*)initWithX:(float)x Y:(float)y width:(float)width height:(float)height;


@end
