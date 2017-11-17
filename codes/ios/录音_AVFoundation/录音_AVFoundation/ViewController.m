//
//  ViewController.m
//  录音_AVFoundation
//
//  Created by to-explore-future on 17/11/9.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
                   


@interface ViewController ()

@property(nonatomic,strong)AVAudioRecorder * recorder;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - button

- (IBAction)start {
    [self.recorder record];
    
}


- (IBAction)stop {
    [self.recorder stop];
}

-(AVAudioRecorder *)recorder{
    if(_recorder == nil){
        // 1.需要一个存储地址的URL
        //获取documentDirectory路径 expandTilde:展开波浪线:http://www.jianshu.com/p/dd3f120eb249
        /**
         *  /Users/sunbin/Library/Developer/CoreSimulator/Devices/08F50B67-51F2-468B-9ECA-0454DC068FDE/data/Containers/Data/Application/2178E83C-3ABF-49C3-8409-EBBD8BA26CAE/Documents
         *  ~/Documents
         */
//        NSArray  * documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSInteger   count    = documents.count;
//        for (int i = 0 ; i < count; i++) {
//            NSLog(@"document%d = %@",i,documents[i]);
//        }
        NSString * path      = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString * filePath  = [path stringByAppendingPathComponent:@"456.caf"];  //给这个路径添加一个文件的 名称带着文件格式
        NSURL    * url       = [NSURL fileURLWithPath:filePath];   //给文件路径的前面添加 file:// 表示一种文件的格式
        NSLog(@"url = %@",url);
        
        // 2.设置声音的参数
        NSDictionary * audioParams = @{AVEncoderAudioQualityKey : [NSNumber numberWithInteger:AVAudioQualityLow],
                                       // 比特率：就是播放的时候一秒钟处理多少数据：视频也叫做码率，数值越高，对数字信号的还原率就越高
                                       // 还原的话：前提是 你的采样率越高，对原始数据的保存就越接近真实，数据量就越大，这时候可选择的比特率(码率)值，就越多
                                       // 但是码率的最大值不能超过采样率的最大值，这两个是两个不同的单位，最终的意思就是：你只有一个不是高清的电影，但是你非要使用超高清的解析模式，去解析这个
                                       // 并不高清的电影，组后你解析出来的还是模糊的，因为原始数据就这些，
                                       /**
                                        *   图片的解析：有一个值 simpleSize ,不设置 simeplesize 为1，一比一解析图片
                                        *   simpleSize 为2 时，按照原图的 1/4 解析图片，
                                        *   我想解析视频 估计也是这么一种道理：高清视频的数据源。我只是从数据源中按照某种规律取出 1/x 这样就可以得到 标清视频，
                                        */
                                       AVEncoderBitRateKey : [NSNumber numberWithInteger:16],
                                       AVSampleRateKey : [NSNumber numberWithFloat:8000],
                                       AVNumberOfChannelsKey : [NSNumber numberWithInteger:2]   //一般音频传2，视频传2.1
                                       };
        
        self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:audioParams error:nil];
    }
    return _recorder;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
