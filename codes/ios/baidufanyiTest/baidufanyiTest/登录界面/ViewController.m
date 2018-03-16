//
//  ViewController.m
//  baidufanyiTest
//
//  Created by sharingmobile on 2018/2/23.
//  Copyright © 2018年 sharingmobile. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"
#import "TextTranslateVC.h"


@interface ViewController ()

@property(nonatomic,strong)UIView * navigationItemBg;

@property(nonatomic,strong)UIImageView  * ivTextTranslate;
@property(nonatomic,strong)UIImageView  * ivTakeAPhotoTranslate;
@property(nonatomic,strong)UIImageView  * ivVoiceTranslate;

@property(nonatomic,strong)UILabel   * tvTextTranslate;
@property(nonatomic,strong)UILabel   * tvTakeAPhotoTranslate;
@property(nonatomic,strong)UILabel   * tvVoiceTranslate;

@property(nonatomic,strong)UIButton * textBtn;
@property(nonatomic,strong)UIButton * takeAPhotoBtn;
@property(nonatomic,strong)UIButton * voiceBtn;

@property(nonatomic,strong)UIView       * userView;
@property(nonatomic,strong)UIImageView  * userIcon;
@property(nonatomic,strong)UILabel      * userName;

@property CGFloat imageViewTop;
@property CGFloat userIconRadius;

@property(nonatomic,strong)UIView       * userLoginView;
@property(nonatomic,strong)UIImageView  * accountIcon;
@property(nonatomic,strong)UIImageView  * passwordIcon;
@property(nonatomic,strong)UIView       * accountIconBg;
@property(nonatomic,strong)UIView       * passwordIconBg;

@property(nonatomic,strong)UITextField  * accountOrEmail;
@property(nonatomic,strong)UITextField  * password;
@property(nonatomic,strong)UIView       * accountOrEmailBg;
@property(nonatomic,strong)UIView       * passwordBg;

@property CGFloat accountPasswordLoginViewHeight;           //账号 密码 登录条的高度

@property(nonatomic,strong)UIButton * login;
@property(nonatomic,strong)UIButton * loginWithOtherAccount;
@property(nonatomic,strong)UIButton * regist;
@property(nonatomic,strong)UIButton * findPassword;


@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"文字翻译";
    [self.view setBackgroundColor:[UIColor colorWithRed:217.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1]];
    self.navigationController.navigationBarHidden = YES;

    CGFloat height = 150;
    
    self.navigationItemBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, height)];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    UIColor * startColor = [UIColor colorWithRed:1.0f/255.0f green:190.0f/255.0f blue:255.0f/255.0f alpha:1];
    UIColor * endColor = [UIColor colorWithRed:0.0f/255.0f green:133.0f/255.0f blue:255.0f/255.0f alpha:1];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0, @1];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, screenWidth, height);
    [self.view.layer addSublayer:gradientLayer];
    [self.navigationItemBg.layer addSublayer:gradientLayer];
    
    [self.view addSubview:self.navigationItemBg];
    NSLog(@"屏幕宽度:%f 屏幕高度:%f",screenWidth,screenHeight);
    
    [self initData];
    
    [self initView];
    
    //测试安全区域
//    UIEdgeInsets safeAreaInserts = self.view.safeAreaInsets;
//    NSLog(@"left = %f,top = %f,right = %f,bottom = %f",safeAreaInserts.left,safeAreaInserts.top,safeAreaInserts.right,safeAreaInserts.bottom);
    //iphone x 的屏幕尺寸
    NSLog(@"screenWidth = %f,screenHeight = %f",screenWidth,screenHeight);
}

-(void)initData{
    self.imageViewTop   = 20;
    self.userIconRadius = 40;
    self.accountPasswordLoginViewHeight = 40;
}

-(void)initView{
    
    [self.view addSubview:self.ivTextTranslate];
    [self.view addSubview:self.ivTakeAPhotoTranslate];
    [self.view addSubview:self.ivVoiceTranslate];
    
    [self.ivTextTranslate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_left).offset(screenWidth / 6);
        make.centerY.mas_equalTo(self.view.mas_top).offset(70);
        make.width.mas_equalTo(screenWidth / 9);
        make.height.mas_equalTo(screenHeight / 19);
    }];
    [self.ivTakeAPhotoTranslate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_left).offset(screenWidth / 6 * 3);
        make.centerY.mas_equalTo(self.view.mas_top).offset(70);
        make.width.mas_equalTo(screenWidth / 9);
        make.height.mas_equalTo(screenHeight / 19);
    }];
    [self.ivVoiceTranslate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_left).offset(screenWidth / 6 * 5);
        make.centerY.mas_equalTo(self.view.mas_top).offset(70);
        make.width.mas_equalTo(screenWidth / 9);
        make.height.mas_equalTo(screenHeight / 19);
    }];
    
    
    [self.view addSubview:self.tvTextTranslate];
    [self.view addSubview:self.tvTakeAPhotoTranslate];
    [self.view addSubview:self.tvVoiceTranslate];
    [self.tvTextTranslate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.ivTextTranslate.mas_centerX);
        make.top.mas_equalTo(self.ivTextTranslate.mas_bottom).offset(20);
    }];
    [self.tvTakeAPhotoTranslate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.ivTakeAPhotoTranslate.mas_centerX);
        make.top.mas_equalTo(self.ivTakeAPhotoTranslate.mas_bottom).offset(20);
    }];
    [self.tvVoiceTranslate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.ivVoiceTranslate.mas_centerX);
        make.top.mas_equalTo(self.ivVoiceTranslate.mas_bottom).offset(20);
    }];
    
    [self.view addSubview:self.textBtn];
    [self.view addSubview:self.takeAPhotoBtn];
    [self.view addSubview:self.voiceBtn];
    
    [self.textBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.ivTextTranslate.mas_centerX);
        make.top.mas_equalTo(self.navigationItemBg.mas_top);
        make.bottom.mas_equalTo(self.navigationItemBg.mas_bottom);
        make.width.mas_equalTo(screenWidth / 3 - 2);
    }];
    [self.takeAPhotoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.ivTakeAPhotoTranslate.mas_centerX);
        make.top.mas_equalTo(self.navigationItemBg.mas_top);
        make.bottom.mas_equalTo(self.navigationItemBg.mas_bottom);
        make.width.mas_equalTo(screenWidth / 3 - 2);
    }];
    [self.voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.ivVoiceTranslate.mas_centerX);
        make.top.mas_equalTo(self.navigationItemBg.mas_top);
        make.bottom.mas_equalTo(self.navigationItemBg.mas_bottom);
        make.width.mas_equalTo(screenWidth / 3 - 2);
    }];
    
    [self.view addSubview:self.userView];
    
    [self.userView addSubview:self.userIcon];
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.userView).offset(5);
        make.width.mas_equalTo(self.userIconRadius * 2);
        make.height.mas_equalTo(self.userIconRadius * 2);
    }];
    
    [self.userView addSubview:self.userName];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.userView.mas_centerX);
        make.top.mas_equalTo(self.userIcon.mas_bottom).offset(10);
    }];
    
    [self.view addSubview:self.userLoginView];
    [self.userLoginView addSubview:self.accountIconBg];
    [self.userLoginView addSubview:self.passwordIconBg];
    
    [self.accountIconBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.userLoginView).offset(30);
        make.top.mas_equalTo(self.userLoginView).offset(20);
        make.height.mas_equalTo(self.accountPasswordLoginViewHeight);
        make.width.mas_equalTo(screenWidth / 4);
    }];

    [Utils setViewCorner:self.accountIconBg withNSOptions:UIRectCornerTopLeft | UIRectCornerBottomLeft withCornerRadii:CGSizeMake(self.accountPasswordLoginViewHeight / 2, self.accountPasswordLoginViewHeight / 2)];
    
    [self.passwordIconBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.userLoginView).offset(30);
        make.top.mas_equalTo(self.accountIconBg.mas_bottom).offset(20);
        make.height.mas_equalTo(self.accountPasswordLoginViewHeight);
        make.width.mas_equalTo(screenWidth / 4);
    }];
    [Utils setViewCorner:self.passwordIconBg withNSOptions:UIRectCornerTopLeft | UIRectCornerBottomLeft withCornerRadii:CGSizeMake(self.accountPasswordLoginViewHeight / 2, self.accountPasswordLoginViewHeight / 2)];
    
    [self.userLoginView addSubview:self.accountOrEmailBg];
    [self.userLoginView addSubview:self.passwordBg];
    
    [self.accountOrEmailBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.accountIconBg.mas_right);
        make.top.mas_equalTo(self.accountIconBg.mas_top);
        make.bottom.mas_equalTo(self.accountIconBg.mas_bottom);
        make.right.mas_equalTo(self.userLoginView.mas_right).offset(-30);
    }];
    [Utils setViewCorner:self.accountOrEmailBg withNSOptions:UIRectCornerTopRight | UIRectCornerBottomRight withCornerRadii:CGSizeMake(self.accountPasswordLoginViewHeight / 2, self.accountPasswordLoginViewHeight / 2)];
   
    [self.passwordBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.passwordIconBg.mas_right);
        make.top.bottom.mas_equalTo(self.passwordIconBg);
        make.right.mas_equalTo(self.userLoginView.mas_right).offset(-30);
    }];
    [Utils setViewCorner:self.passwordBg withNSOptions:UIRectCornerTopRight | UIRectCornerBottomRight withCornerRadii:CGSizeMake(self.accountPasswordLoginViewHeight / 2, self.accountPasswordLoginViewHeight / 2)];
    
    [self.accountIconBg addSubview:self.accountIcon];
    [self.passwordIconBg addSubview:self.passwordIcon];
    [self.accountIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.accountIconBg);
        make.width.height.mas_equalTo(25);
    }];
    [self.passwordIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.passwordIconBg);
        make.width.height.mas_equalTo(25);
    }];
    
    [self.accountOrEmailBg addSubview:self.accountOrEmail];
    [self.passwordBg addSubview:self.password];
    [self.accountOrEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.accountOrEmailBg.mas_centerY);
        make.left.mas_equalTo(self.accountOrEmailBg).offset(10);
        make.right.mas_equalTo(self.accountOrEmailBg.mas_right).offset(-20);
        make.height.mas_equalTo(self.accountPasswordLoginViewHeight - 10);
    }];
    [self.password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.passwordBg.mas_centerY);
        make.left.mas_equalTo(self.passwordBg).offset(10);
        make.right.mas_equalTo(self.passwordBg.mas_right).offset(-20);
        make.height.mas_equalTo(self.accountPasswordLoginViewHeight - 10);
    }];
    
    [self.userLoginView addSubview:self.login];
    [self.login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.userLoginView).offset(30);
        make.right.mas_equalTo(self.userLoginView.mas_right).offset(-30);
        make.height.mas_equalTo(self.accountPasswordLoginViewHeight);
        make.top.mas_equalTo(self.passwordBg.mas_bottom).offset(40);
    }];
    
    [self.view addSubview:self.loginWithOtherAccount];
    [self.view addSubview:self.regist];
    [self.view addSubview:self.findPassword];
    [self.loginWithOtherAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-safeAreaBottomHeight);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(-80);
    }];
    [self.regist mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-safeAreaBottomHeight);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    [self.findPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-safeAreaBottomHeight);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(80);
    }];

}

#pragma mark - action

-(void)textBtnAction{
    NSLog(@"打开文字翻译页面");
    TextTranslateVC * textTranslate = [[TextTranslateVC alloc] init];
    [self.navigationController pushViewController:textTranslate animated:YES];
}

-(void)takeAPhotoBtnAction{
    NSLog(@"打开拍照翻译页面");
}

-(void)voiceBtnAction{
    NSLog(@"打开语音翻译页面");
}

-(void)loginAction{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.accountOrEmail resignFirstResponder];
    [self.password resignFirstResponder];
}


#pragma mark - lazyload

-(UIImageView *)ivTextTranslate{
    if (_ivTextTranslate == nil) {
        _ivTextTranslate = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text_icon.png"]];
    }
    return _ivTextTranslate;
}

-(UIImageView *)ivTakeAPhotoTranslate{
    if (_ivTakeAPhotoTranslate == nil) {
        _ivTakeAPhotoTranslate = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera_icon.png"]];
    }
    return _ivTakeAPhotoTranslate;
}

-(UIImageView *)ivVoiceTranslate{
    if (_ivVoiceTranslate == nil) {
        _ivVoiceTranslate = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speak_icon.png"]];
    }
    return _ivVoiceTranslate;
}

-(UILabel *)tvTextTranslate{
    if (_tvTextTranslate == nil) {
        _tvTextTranslate = [[UILabel alloc] init];
        [_tvTextTranslate setText:@"文字翻译"];
        [_tvTextTranslate setTextColor:[UIColor whiteColor]];
        [_tvVoiceTranslate sizeToFit];
    }
    return _tvTextTranslate;
}

-(UILabel *)tvTakeAPhotoTranslate{
    if (_tvTakeAPhotoTranslate == nil) {
        _tvTakeAPhotoTranslate = [[UILabel alloc] init];
        [_tvTakeAPhotoTranslate setText:@"拍照翻译"];
        [_tvTakeAPhotoTranslate setTextColor:[UIColor whiteColor]];
        [_tvTakeAPhotoTranslate sizeToFit];
    }
    return _tvTakeAPhotoTranslate;
}

-(UILabel *)tvVoiceTranslate{
    if (_tvVoiceTranslate == nil) {
        _tvVoiceTranslate = [[UILabel alloc] init];
        [_tvVoiceTranslate setText:@"语音翻译"];
        [_tvVoiceTranslate setTextColor:[UIColor whiteColor]];
        [_tvVoiceTranslate sizeToFit];
    }
    return _tvVoiceTranslate;
}

-(UIButton *)textBtn{
    if (_textBtn == nil) {
        _textBtn = [[UIButton alloc] init];
        [_textBtn setBackgroundColor:[UIColor clearColor]];
        [_textBtn addTarget:self action:@selector(textBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _textBtn;
}

-(UIButton *)takeAPhotoBtn{
    if (_takeAPhotoBtn == nil) {
        _takeAPhotoBtn = [[UIButton alloc] init];
        [_takeAPhotoBtn setBackgroundColor:[UIColor clearColor]];
        [_takeAPhotoBtn addTarget:self action:@selector(takeAPhotoBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _takeAPhotoBtn;
}

-(UIButton *)voiceBtn{
    if (_voiceBtn == nil) {
        _voiceBtn = [[UIButton alloc] init];
        [_voiceBtn setBackgroundColor:[UIColor clearColor]];
        [_voiceBtn addTarget:self action:@selector(voiceBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _voiceBtn;
}

-(UIView *)userView{
    if (_userView == nil) {
        _userView = [[UIView alloc] initWithFrame:CGRectMake(0, 180, screenWidth, 120)];
        [_userView setBackgroundColor:[UIColor clearColor]];
    }
    return _userView;
}

-(UIImageView *)userIcon{
    if (_userIcon == nil) {
        _userIcon = [[UIImageView alloc] init];
        [_userIcon setImage:[UIImage imageNamed:@"head_icon.png"]];
        _userIcon.layer.cornerRadius = self.userIconRadius;
        [_userIcon clipsToBounds];
    }
    return _userIcon;
}

-(UILabel *)userName{
    if (_userName == nil) {
        _userName = [[UILabel alloc] init];
        [_userName setText:@"城市的风"];
        [_userName setTextColor:[Utils getColorWithRed:109 Green:128 Blue:128]];
        [_userName sizeToFit];
    }
    return _userName;
}

-(UIView *)userLoginView{
    if (_userLoginView == nil) {
        _userLoginView = [[UIView alloc] initWithFrame:CGRectMake(0, 340, screenWidth, 260)];
        [_userLoginView setBackgroundColor:[UIColor clearColor]];
    }
    return _userLoginView;
}

-(UIView *)accountIconBg{
    if (_accountIconBg == nil) {
        _accountIconBg = [[UIView alloc] init];
        [_accountIconBg setBackgroundColor:[UIColor whiteColor]];
    }
    return _accountIconBg;
}

-(UIView *)passwordIconBg{
    if (_passwordIconBg == nil) {
        _passwordIconBg = [[UIView alloc] init];
        [_passwordIconBg setBackgroundColor:[UIColor whiteColor]];
    }
    return _passwordIconBg;
}

-(UIView *)accountOrEmailBg{
    if (_accountOrEmailBg == nil) {
        _accountOrEmailBg = [[UIView alloc] init];
        [_accountOrEmailBg setBackgroundColor:[Utils getColorWithOneValue:240]];
    }
    return _accountOrEmailBg;
}


-(UIView *)passwordBg{
    if (_passwordBg == nil) {
        _passwordBg = [[UIView alloc] init];
        [_passwordBg setBackgroundColor:[Utils getColorWithOneValue:240]];
    }
    return _passwordBg;
}

-(UIImageView *)accountIcon{
    if (_accountIcon == nil) {
        _accountIcon = [[UIImageView alloc] init];
        [_accountIcon setImage:[Utils getImageByPathWithImageName:@"account_icon.png"]];
    }
    return _accountIcon;
}

-(UIImageView *)passwordIcon{
    if (_passwordIcon == nil) {
        _passwordIcon = [[UIImageView alloc] init];
        [_passwordIcon setImage:[Utils getImageByPathWithImageName:@"password_icon.png"]];
    }
    return _passwordIcon;
}

-(UITextField *)accountOrEmail{
    if (_accountOrEmail == nil) {
        _accountOrEmail = [[UITextField alloc] init];
        [_accountOrEmail setPlaceholder:@"输入账号或者邮箱"];
    }
    return _accountOrEmail;
}

-(UITextField *)password{
    if (_password == nil) {
        _password = [[UITextField alloc] init];
        [_password setPlaceholder:@"输入密码"];
    }
    return _password;
}

-(UIButton *)login{
    if (_login == nil) {
        _login = [[UIButton alloc] init];
        [_login addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
        [_login setBackgroundImage:[Utils getImageByPathWithImageName:@"loginBtn_default.png"] forState:UIControlStateNormal];
        [_login setBackgroundImage:[Utils getImageByPathWithImageName:@"loginBtn_selected.png"] forState:UIControlStateFocused];
        [_login setTitle:@"登录" forState:UIControlStateNormal];
        [_login.titleLabel setFont:[UIFont systemFontOfSize:20]];
        [_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_login.titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _login;
}

-(UIButton *)loginWithOtherAccount{
    if (_loginWithOtherAccount == nil) {
        _loginWithOtherAccount = [[UIButton alloc] init];
        [_loginWithOtherAccount setTitle:@"第三方登录" forState:UIControlStateNormal];
        [_loginWithOtherAccount setTitleColor:[Utils getColorWithRed:91 Green:233 Blue:234] forState:UIControlStateNormal];
        [_login sizeToFit];
    }
    return _loginWithOtherAccount;
}

-(UIButton *)regist{
    if (_regist == nil) {
        _regist = [[UIButton alloc] init];
        [_regist setTitle:@"注册" forState:UIControlStateNormal];
        [_regist setTitleColor:[Utils getColorWithRed:91 Green:233 Blue:234] forState:UIControlStateNormal];
        [_login sizeToFit];
    }
    return _regist;
}

-(UIButton *)findPassword{
    if (_findPassword == nil) {
        _findPassword = [[UIButton alloc] init];
        [_findPassword setTitle:@"找回密码" forState:UIControlStateNormal];
        [_findPassword setTitleColor:[Utils getColorWithRed:91 Green:233 Blue:234] forState:UIControlStateNormal];
        [_findPassword sizeToFit];
    }
    return _findPassword;
}

#pragma mark - other

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
