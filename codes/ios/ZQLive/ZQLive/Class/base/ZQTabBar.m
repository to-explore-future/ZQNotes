//
//  ZQTabBar.m
//  ZQLive
//
//  Created by to-explore-future on 17/11/3.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQTabBar.h"


@interface ZQTabBar()   //对本类的扩展 而不是修改

@property(nonatomic,strong)UIImageView * tabBgView;

@property(nonatomic,strong)NSArray * dataList;      //记录那两个button的名字

@property(nonatomic,strong)UIButton * selectedBtn;

@property(nonatomic,strong)UIButton * cameraBtn;

@end


@implementation ZQTabBar

/**
 *  只会初始化一次
 */
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tabBgView];   //load bgImage
        NSInteger count = self.dataList.count;
        for(NSInteger i = 0 ; i < count ; i ++){
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.adjustsImageWhenHighlighted = NO;
            [btn setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            NSString * selectedName = [self.dataList[i] stringByAppendingString:@"_p"];
            [btn setImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = ZQButtonItemLive + i;
            if (i == 0) {
                btn.selected = YES;
                self.selectedBtn = btn;     //记录一下选中的按钮
            }
            [self addSubview:btn];
        }
        
        //add live streaming button
        [self addSubview:self.cameraBtn];
    }
    return self;
}

/**
 *
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger btnCount = self.dataList.count;
    NSInteger subViewCount = [self subviews].count;
    CGFloat btnWidth = self.bounds.size.width / btnCount;
    CGFloat btnHeight = self.bounds.size.height ;
    for (NSInteger i = 0; i < subViewCount; i++) {
        UIView * subView = [self subviews][i];
        if ([subView isKindOfClass:[UIButton class]]) {
            /**
             *  这里就是给按钮指定一个放置位置，(subView.tag - ZQButtonItemLive)
             *  这样写能够保证 tag小的按钮，放在前面，按照button初始化的顺序放置按钮
             */
            subView.frame = CGRectMake((subView.tag - ZQButtonItemLive)*btnWidth, 0, btnWidth,btnHeight);
        }
    }
    
    //set live streaming button's position
    [self.cameraBtn sizeToFit];             //set the button's size fit to the image which set to the button
    self.cameraBtn.center = CGPointMake(self.center.x, 10);

}

-(UIImageView*) tabBgView{
    if (!_tabBgView) {
        _tabBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabBgView;
}

-(NSArray*)dataList{
    if(!_dataList){
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}

-(UIButton *)cameraBtn{
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        _cameraBtn.tag = ZQButtonItemLaunch;
    }
    return _cameraBtn;
}

//点击按钮的时候回调这个方法
-(void)pressBtn:(UIButton*)button{
    //一个类可能有多个代理，判断一下这个代理 和 我们所期望的代理方法 石头匹配，
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        //如果匹配，把参数给代理，让代理去执行
        [self.delegate tabbar:self clickButton:button.tag];
    }
    /**
     *  block 的写法
     *  三元表达式写法：!self.block?:self.block(self,button.tag); --> ?:中间省略了，表示没有表达式，什么都不做
     */
    if(self.block){
        self.block(self,button.tag);
    }
    self.selectedBtn.selected = NO;     //取消上一个被选中的按钮的选中状态
    button.selected = YES;              //当前的按钮被选中
    self.selectedBtn = button;          //记录当前的按钮
    
    if (button.tag == ZQButtonItemLaunch) {
        return;
    }
    //设置动画
    [UIView animateWithDuration:0.2 animations:^{
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            button.transform = CGAffineTransformIdentity;       //default si ***Identity
        }];
    }];
    
}

@end
