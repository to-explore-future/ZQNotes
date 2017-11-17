//
//  ZQAudioTool.m
//  播放音效
//
//  Created by to-explore-future on 17/11/10.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQAudioTool.h"
#import <AVFoundation/AVFoundation.h>


@implementation ZQAudioTool

static NSMutableDictionary * _soundIDs;
static NSMutableDictionary * _players;  //

+ (void)initialize{
    if (_soundIDs == nil) {
        _soundIDs   = [NSMutableDictionary dictionary];
        _players    = [NSMutableDictionary dictionary];
    }
}

#pragma mark - 播放音效
+ (void) playSoundWithSoundName:(NSString *)soundName{
    SystemSoundID soundID = 0;
    soundID = [_soundIDs[soundName] unsignedIntValue] ;
    if(soundID == 0){           // 判断soundID 是否为0
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];//只是转换  并没有改变所有权，依然是 ARC 所有
        AudioServicesCreateSystemSoundID(url, &soundID );
        [_soundIDs setObject:@(soundID) forKey:soundName];
    }
    AudioServicesPlaySystemSound(soundID);
}

#pragma  mark - 播放音乐
//播放音乐
+ (void) playMusicWithMusicName:(NSString *)musicName{
    //1.创建播放器
    AVAudioPlayer *player = nil;
    //2.从字典中取出播放器
    player = _players[musicName];
    //3.判断播放器是否能用
    if (player == nil) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        if (url == nil) {       //有时候资源可能传入错误
            return ;
        }
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [_players setObject:player forKey:musicName];
    }
    [player prepareToPlay];
    [player play];
}
//暂停音乐
+ (void) pauseMusicWithMusicName:(NSString *)musicName{
    //一首音乐对应着一个播放器，根据音乐名称 到字典中取出音乐播放器（使用音乐名称创建音乐播放器，容易导致重名 可以考虑使用某种算法）
    AVAudioPlayer * player = nil;
    player  = _players[musicName];
    if (player == nil) {
        return ;
    }
    [player pause];
}
//停止音乐
+ (void) stopMusicWithMusicName:(NSString *)musicName{
    AVAudioPlayer * player = nil;
    player  = _players[musicName];
    if (player == nil) {
        return ;
    }
    [player stop];
    [_players removeObjectForKey:musicName];
    player = nil;
}

@end
