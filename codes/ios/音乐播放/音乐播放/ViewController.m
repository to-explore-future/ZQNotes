//
//  ViewController.m
//  音乐播放
//
//  Created by to-explore-future on 17/11/10.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "ZQAudioTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)begin {
    [ZQAudioTool playMusicWithMusicName:@"后来.mp3"];
}
- (IBAction)pause {
    [ZQAudioTool pauseMusicWithMusicName:@"后来.mp3"];
}
- (IBAction)stop {
    [ZQAudioTool stopMusicWithMusicName:@"后来.mp3"];
}


@end
