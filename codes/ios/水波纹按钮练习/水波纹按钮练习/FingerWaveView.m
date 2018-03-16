//
//  FingerWaveView.m
//  水波纹按钮练习
//
//  Created by sharingmobile on 2018/3/7.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "FingerWaveView.h"

@interface FingerWaveView () <CAAnimationDelegate>{
    CGSize waveSize;                //水波纹的大小
    NSTimeInterval duration;        //水波纹持续的时间
}
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,strong)FingerWaveView * waveView;

@end

@implementation FingerWaveView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        waveSize = CGSizeMake(300, 300);
        duration = 5.0;
    }
    return self;
}

+ (instancetype)showInView:(UIView *)view center:(CGPoint)center {
    FingerWaveView *waveView = [[FingerWaveView alloc] init];
    [waveView setframeWithCenter:center];
    [view addSubview:waveView];
    return waveView;
}

- (void)didMoveToSuperview{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.9 repeats:YES block:^(NSTimer * _Nonnull timer) {
        CAShapeLayer *waveLayer = [[CAShapeLayer alloc] init];
        waveLayer.backgroundColor  = [UIColor clearColor].CGColor;
        waveLayer.opacity = 0.3;
        waveLayer.fillColor = [UIColor whiteColor].CGColor;
        [self.layer addSublayer:waveLayer];
        [self startAnimationInLayer:waveLayer];
//        NSLog(@"执行次数");
    }];
}

-(void)removeAllSubLayter{
    if ([self.timer isValid]) {
        [self.timer invalidate];
    }
    NSInteger count = self.layer.sublayers.count;
    NSArray * layers = self.layer.sublayers;
    for (int i = 0; i < count; i++) {
        [layers[i] removeFromSuperlayer];
    }
}

- (void)startAnimationInLayer:(CALayer *)layer{
    
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithArcCenter:[self pathCenter] radius:[self animationBeginRadius] startAngle:0 endAngle:M_PI*2 clockwise:YES];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:[self pathCenter] radius:[self animationEndRadius] startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CABasicAnimation *rippleAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    rippleAnimation.delegate = self;
    rippleAnimation.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    rippleAnimation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    rippleAnimation.duration = duration;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.delegate = self;
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.6];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.duration = duration;
    
    //只是给这个animation起了个名字，可以针对这个名字，取消指定的animation
    [layer addAnimation:rippleAnimation forKey:@"rippleAnimation"];
    [layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    [self performSelector:@selector(removeRippleLayer:) withObject:layer afterDelay:duration];
}

- (void)removeRippleLayer:(CAShapeLayer *)rippleLayer{
    [rippleLayer removeFromSuperlayer];
    rippleLayer = nil;
}

- (void)setframeWithCenter:(CGPoint)center{
    CGRect frame = CGRectMake(center.x - waveSize.width * 0.5, center.y - waveSize.height * 0.5, waveSize.width, waveSize.height);
    self.frame = frame;;
}

- (CGFloat)animationBeginRadius{
    return waveSize.width * 0.5 * 0.2;
}

- (CGFloat)animationEndRadius{
    return waveSize.width * 0.5;
}

- (CGPoint)pathCenter{
    return CGPointMake(waveSize.width * 0.5, waveSize.height * 0.5);
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        [self removeFromSuperview];
    }
}


@end
