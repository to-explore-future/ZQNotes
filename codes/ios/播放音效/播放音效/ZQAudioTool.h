//
//  ZQAudioTool.h
//  播放音效
//
//  Created by to-explore-future on 17/11/10.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQAudioTool : NSObject
#pragma mark - 播放音效
+ (void) playSoundWithSoundName:(NSString *)soundName;
#pragma mark - 播放音乐
+ (void) playMusicWithMusicName:(NSString *)musicName;
+ (void) pauseMusicWithMusicName:(NSString *)musicName;
+ (void) stopMusicWithMusicName:(NSString *)musicName;
@end
