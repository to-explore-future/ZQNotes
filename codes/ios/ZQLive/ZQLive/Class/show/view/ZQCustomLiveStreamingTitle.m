//
//  ZQCustomLiveStreamingTitle.m
//  ZQLive
//
//  Created by to-explore-future on 17/11/6.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ZQCustomLiveStreamingTitle.h"


@interface ZQCustomLiveStreamingTitle ()

@property(nonatomic,strong)UIView * horizontalLine;


@end


@implementation ZQCustomLiveStreamingTitle

-(instancetype)initWithFrame:(CGRect)frame AndTitleNames:(NSArray *)titleNames{
    self = [super initWithFrame:frame];
//    self.backgroundColor = [UIColor redColor];
    if (self) {
        NSInteger count = titleNames.count;
        
        NSInteger btnWidth =  self.frame.size.width / titleNames.count;
        buttonWidth = btnWidth;
        for (NSInteger i = 0; i < count; i++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString * btnTitle = titleNames[i];
            [btn setTitle:btnTitle forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.frame = CGRectMake(i * btnWidth , 0, btnWidth, 35);
            [btn addTarget:self action:@selector(titleBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 200 + i;
            [self addSubview:btn];
            
            if (i == 1) {
                self.horizontalLine = [[UIView alloc] init];
                self.horizontalLine.backgroundColor = [UIColor whiteColor];
                self.horizontalLine.frame = CGRectMake(i *btnWidth, 36, btnWidth, 2);
                [self addSubview:self.horizontalLine];
            }
        }
        
       
    }
    return self;
}

//当按钮 被点击的时候，修改下面的长条，切换viewController
-(void)titleBtnPressed:(UIButton*)button {
    // 长条怎么改
    [UIView animateWithDuration:0.5 animations:^{
        NSInteger btnWidth = button.frame.size.width;
        self.horizontalLine.frame = CGRectMake((button.tag - 200)*btnWidth, 36, btnWidth, 2);
    }];
    //把button、传递出去
    [self.delegate button:button];
    
}

//当scrollview 手动滚动的时候会回调这个 方法
- (void)scrollViewPageIndex:(NSInteger)pageIndex{
    
    [UIView animateWithDuration:0.5 animations:^{
        NSInteger btnWidth = buttonWidth;
        self.horizontalLine.frame = CGRectMake(pageIndex * btnWidth, 36, btnWidth, 2);
    }];
}

@end
