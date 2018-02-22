//
//  ViewController.m
//  XF_Test2_ios
//
//  Created by sharingmobile on 2018/2/9.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property(nonatomic,strong) IFlySpeechRecognizer    * iFlySpeechRecognizer;
@property(nonatomic,strong) UIButton                * startListening;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview: self.startListening];
}

#pragma mark - iflyDelegate

//IFlySpeechRecognizerDelegate协议实现
//识别结果返回代理
- (void) onResults:(NSArray *) results isLast:(BOOL)isLast{}
//识别会话结束返回代理
- (void)onError: (IFlySpeechError *) error{}
//停止录音回调
- (void) onEndOfSpeech{}
//开始录音回调
- (void) onBeginOfSpeech{}
//音量回调函数
- (void) onVolumeChanged: (int)volume{}
//会话取消回调
- (void) onCancel{}

#pragma mark - lazyload

-(UIButton *)startListening{
    if (_startListening == nil) {
        _startListening = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
        [_startListening setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [_startListening setTitle:@"开始识别" forState:UIControlStateNormal];
        [_startListening setBackgroundColor:[UIColor whiteColor]];
        [_startListening addTarget:self action:@selector(startClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startListening;
}

-(IFlySpeechRecognizer *)iFlySpeechRecognizer{
    if (_iFlySpeechRecognizer == nil) {
        _iFlySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
        _iFlySpeechRecognizer.delegate = self;
    }
    return _iFlySpeechRecognizer;
}



#pragma mark - action

-(void)startClicked{
    [self.iFlySpeechRecognizer setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
    [self.iFlySpeechRecognizer setParameter:@"iat.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    //启动识别服务
    [self.iFlySpeechRecognizer startListening];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
