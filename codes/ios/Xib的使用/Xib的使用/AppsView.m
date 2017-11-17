//
//  AppsView.m
//  Xib的使用
//
//  Created by to-explore-future on 17/11/13.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "AppsView.h"
#import "App.h"

@interface AppsView ()

@property (weak, nonatomic) IBOutlet UIImageView    *imageView;
@property (weak, nonatomic) IBOutlet UILabel        *appName;
@property (weak, nonatomic) IBOutlet UIButton
*download;
- (IBAction)buttonClick:(UIButton *)sender;

@end

@implementation AppsView

-(void)setModel:(App *)model{
    _model = model;
    NSString * name         = model.icon;
    self.imageView.image    = [UIImage imageNamed:name];
    self.appName.text       = model.name;
}

- (IBAction)buttonClick:(UIButton *)sender {
    //当我点击之后这个按钮 就变成不可点击状态
    sender.enabled = NO;
    sender.backgroundColor = [UIColor grayColor];
    
    //弹出一个label ，模拟提示框
    UILabel * toast     = [[UILabel alloc] init];
    NSInteger width     = 150;
    NSInteger height    = 30;
    NSInteger x         = ( self.superview.frame.size.width - width ) / 2;
    NSInteger y         = ( self.superview.frame.size.height - height) / 2;
    toast.frame         = CGRectMake(x, y, width, height);
    toast.text          = @"正在下载";
    toast.textColor     = [UIColor redColor];
    toast.textAlignment = NSTextAlignmentCenter;
    toast.font          = [UIFont boldSystemFontOfSize:15];
    
    toast.backgroundColor = [UIColor blackColor];
    toast.alpha = 0;
    toast.layer.cornerRadius = 10;
    toast.layer.masksToBounds = YES;
    
    //使用动画 让这个慢慢的展示出来
    [UIView animateWithDuration:1.5 animations:^{
        toast.alpha = 0.7;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
            toast.alpha = 0;
            toast.text = @"下载完成";
        } completion:^(BOOL finished) {
            [toast removeFromSuperview];
        }];
    }];
    
    [self.superview addSubview:toast];
}
@end
