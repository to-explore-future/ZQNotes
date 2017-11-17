//
//  ViewController.m
//  播放音效
//
//  Created by to-explore-future on 17/11/9.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ZQAudioTool.h"

@interface ViewController ()

@property(nonatomic,assign)SystemSoundID soundID;
@property(nonatomic,strong)NSMutableDictionary * soundIDs;

@end

@implementation ViewController

#pragma mark - 触摸屏幕

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 /*
    // 1.创建systemSoundID
    SystemSoundID soundID = 0;//这个是一个基本数据类型，值传递是不会改变这个值的，
    //关于 core Foundation <==> Foundation 之间的相互转换问题  桥接问题
    // http://blog.csdn.net/yiyaaixuexi/article/details/8553659  桥接很重要
    
    // 2.生成soundID
    CFURLRef url = (__bridge CFURLRef)([[NSBundle mainBundle] URLForResource:@"壁炉中木柴燃烧的声音.wav" withExtension:nil]);//至于一类要不要带着* 点进去 看看父类最终是谁就知道了
    AudioServicesCreateSystemSoundID(url, &soundID);
*/
    // 3.播放音效
    AudioServicesPlaySystemSound(self.soundID);
    AudioServicesPlayAlertSound(self.soundID);
}

- (SystemSoundID)soundID{
    /**
     *  soundID是什么：系统根据这个声音的路径声音的名称，生成了这个声音资源的 一个唯一的ID(用户区分其他的所有的声音的ID)
     *  就好比是一个资源的MD5，就相当于git的每次提交的 commit id，这个id是系统生成的 。
     */
    if(_soundID == 0){
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:@"消防车的声音.wav" withExtension:nil];//只是转换  并没有改变所有权，依然是 ARC 所有
        AudioServicesCreateSystemSoundID(url, &_soundID );
    }
    return _soundID;
}

- (NSMutableDictionary *)soundIDs{
    if (_soundIDs == nil) {
        _soundIDs = [NSMutableDictionary dictionary];
    }
    return _soundIDs;
}

#pragma  mark - 各种按钮

- (IBAction)fireEngineSound:(id)sender {
//    [self playSoundWithSoundName:@"消防车的声音.wav"];
    [ZQAudioTool playSoundWithSoundName:@"消防车的声音.wav"];
}

- (IBAction)theSoundOfACarEngine:(id)sender {
//    [self playSoundWithSoundName:@"汽车发动声音.mp3"];
    [ZQAudioTool playSoundWithSoundName:@"汽车发动声音.mp3"];
}

#pragma mark - 播放声音封装的方法

-(void) playSoundWithSoundName:(NSString *)soundName{
    SystemSoundID soundID = 0;
    soundID = [self.soundIDs[soundName] unsignedIntValue] ;
    if(soundID == 0){           // 判断soundID 是否为0
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];//只是转换  并没有改变所有权，依然是 ARC 所有
        AudioServicesCreateSystemSoundID(url, &soundID );
        [self.soundIDs setObject:@(soundID) forKey:soundName];
    }
    AudioServicesPlaySystemSound(soundID);
}

@end
