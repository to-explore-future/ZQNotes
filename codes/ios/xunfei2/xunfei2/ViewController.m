//
//  ViewController.m
//  xunfei2
//
//  Created by sharingmobile on 2018/2/11.
//

#import "ViewController.h"
#import "IFlyMSC/IFlyMSC.h"
#import "IATConfig.h"
#import "ISRDataHelper.h"

@interface ViewController ()<IFlySpeechRecognizerDelegate>

@property(nonatomic,strong)IFlySpeechRecognizer * iflySpeechRecognizer;
@property(nonatomic,strong)UITextView       * textView;
@property(nonatomic,strong)UIButton         * start;

@end

@implementation ViewController

- (void)startRecode {
    _iflySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
    //设置识别参数
    //设置为听写模式
    [_iflySpeechRecognizer setParameter: @"iat" forKey: [IFlySpeechConstant IFLY_DOMAIN]];
    //asr_audio_path 是录音文件名，设置value为nil或者为空取消保存，默认保存目录在Library/cache下。
    [_iflySpeechRecognizer setParameter:@"iat.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    _iflySpeechRecognizer.delegate = self;
    //启动识别服务
    [_iflySpeechRecognizer startListening];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.start];
    [self.view addSubview:self.textView];
    
    
//    [self startRecode];
    // Do any additional setup after loading the view, typically from a nib.
}

//IFlySpeechRecognizerDelegate协议实现
//识别结果返回代理
- (void) onResults:(NSArray *) results isLast:(BOOL)isLast{
    NSMutableString * resultString = [[NSMutableString alloc] init];
    NSDictionary * dic = results[0];
    NSLog(@"dic = %@",dic);
    for (NSString * key in dic) {
        [resultString appendFormat:@"%@",key];
    }
    NSString * result = [NSString stringWithFormat:@"%@%@",@"",resultString];
    NSLog(@"正式结果 ：%@",result);
    
    NSString * resultFromJson = nil;
    if ([IATConfig sharedInstance].isTranslate) {//是否开起来了 自动翻译
        
    }else{
        resultFromJson = [ISRDataHelper stringFromJson:resultString];
    }
    [self.textView setText:[NSString stringWithFormat:@"%@%@",self.textView.text,resultFromJson]];
    NSLog(@"IFlySpeechRecognizer-onResults-录音有了结果:%@",resultFromJson);
}
//识别会话结束返回代理
- (void)onError: (IFlySpeechError *) error{
    NSLog(@"解析出错");
}
//停止录音回调
- (void) onEndOfSpeech{
    NSLog(@"停止录音回调");
}
//开始录音回调
- (void) onBeginOfSpeech{
    NSLog(@"开始录音回调");
}
//音量回调函数
- (void) onVolumeChanged: (int)volume{
    NSLog(@"音量回调函数 当前音量 %d",volume);
}
//会话取消回调
- (void) onCancel{
    NSLog(@"会话取消回调");
}

#pragma mark - lazyload

-(UIButton *)start{
    if (_start == nil) {
        _start = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/ 2, 400, 100, 30)];
        [_start setTitle:@"开始录音" forState:UIControlStateNormal];
        [_start setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_start addTarget:self action:@selector(startRecord) forControlEvents:UIControlEventTouchUpInside];
        [_start.titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _start;
}

-(UITextView *)textView{
    if(_textView == nil){
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 50, WIDTH - 20, 300)];
        _textView.layer.cornerRadius = 5;
        [_textView clipsToBounds];
        _textView.layer.borderWidth = 2;
        _textView.layer.borderColor = [[UIColor redColor] CGColor];
    }
    return _textView;
}

#pragma mark - action

-(void)startRecord{
    NSLog(@"开始录音");
    [self startRecode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
