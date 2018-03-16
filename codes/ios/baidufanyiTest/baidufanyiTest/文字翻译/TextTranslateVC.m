//
//  TextTranslateVC.m
//  baidufanyiTest
//
//  Created by sharingmobile on 2018/2/24.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "TextTranslateVC.h"

@interface TextTranslateVC ()

@property(nonatomic,strong)UIView * languageTrans;

@property(nonatomic,strong)UIButton     * from;
@property(nonatomic,strong)UIButton     * to;
@property(nonatomic,strong)UIImageView  * fromTo;

@end

@implementation TextTranslateVC

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    self.navigationItem.title = @"文字翻译";
    [self.navigationController.navigationBar setBackgroundImage:[Utils getImageByPathWithImageName:@"statusbar.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

-(void)initNotification{
    NSLog(@"initNotification");
}

-(void)initData{
    NSLog(@"initData");
}

-(void)initFrame{
    NSLog(@"initFrame");
    [self.view addSubview:self.languageTrans];
    [self.languageTrans mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(55);
    }];
}

-(void)loadData{
    NSLog(@"loadData");
}

#pragma mark - lazyload

-(UIView *)languageTrans{
    if (_languageTrans == nil) {
        _languageTrans = [[UIView alloc]init];
        [_languageTrans setBackgroundColor:[UIColor whiteColor]];
    }
    return _languageTrans;
}

//-(UIButton *)from{
//    if (_from == nil) {
//        _from = [[UIButton alloc] init];
//        [_from setTitle:@"" forState:UIControlStateNormal];
//        [_from setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
////        _from setImage:[Utils getImageByPathWithImageName:@] forState:<#(UIControlState)#>
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
