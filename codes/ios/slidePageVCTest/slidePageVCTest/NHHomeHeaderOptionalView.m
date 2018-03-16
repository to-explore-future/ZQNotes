//
//  NHHomeHeaderOptionalView.m
//  NeiHan
//
//  Created by Charles on 16/8/30.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "NHHomeHeaderOptionalView.h"
#import "UIButton+Addition.h"
#import "NHHomeHeaderOptionalViewItemView.h"
#import "NSString+Size.h"

#define kRGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define kRGBColor(r,g,b) kRGBAColor(r,g,b,1.0f)
#define kCommonHighLightRedColor [UIColor redColor]
#define kCommonBlackColor [UIColor colorWithRed:0.17f green:0.23f blue:0.28f alpha:1.00f]
#define kSeperatorColor kRGBColor(234,237,240)
#define kLineHeight (1 / [UIScreen mainScreen].scale)

@interface NHHomeHeaderOptionalView () <UIScrollViewDelegate>
@property (nonatomic, weak) CALayer *lineLayer;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, weak) CALayer *middleLineLayer;

@end

@implementation NHHomeHeaderOptionalView

// 设置偏移量
- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    
    CGFloat offsetX = contentOffset.x;
    // 当前索引
    NSInteger index = offsetX / kScreen_width;
    
    NHHomeHeaderOptionalViewItemView *leftItem = (NHHomeHeaderOptionalViewItemView *)[self.scrollView viewWithTag:index + 1];
    // 下一个按钮 如果rightBtnLeftDelta > 0则下一个按钮开始渲染
    NHHomeHeaderOptionalViewItemView *rightItem = (NHHomeHeaderOptionalViewItemView *)[self.scrollView viewWithTag:index + 2];
    
    // right
    // 相对于当前屏幕的宽度
    CGFloat rightPageLeftDelta = offsetX - index * kScreen_width;
    CGFloat progress = rightPageLeftDelta / kScreen_width;
    
    if ([leftItem isKindOfClass:[NHHomeHeaderOptionalViewItemView class]]) {
        leftItem.textColor = kCommonHighLightRedColor;
        leftItem.fillColor = kCommonBlackColor;
        leftItem.progress = progress;
    }
    
    if ([rightItem isKindOfClass:[NHHomeHeaderOptionalViewItemView class]]) {
        rightItem.textColor = kCommonBlackColor;
        rightItem.fillColor = kCommonHighLightRedColor;
        rightItem.progress = progress;
    }
    
    for (NHHomeHeaderOptionalViewItemView *itemView in self.scrollView.subviews) {
        if ([itemView isKindOfClass:[NHHomeHeaderOptionalViewItemView class]]) {
            if (itemView.tag != index + 1 && itemView.tag != index + 2) {
                itemView.textColor = kCommonBlackColor;
                itemView.fillColor = kCommonHighLightRedColor;
                itemView.progress = 0.0;
            }
        }
    }
    
    // 重置当前索引
    self.currentIndex = index;
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    // 标题
    if (titles.count) {
        for (int i = 0; i < titles.count; i++) {
            NHHomeHeaderOptionalViewItemView *item = [[NHHomeHeaderOptionalViewItemView alloc] init];
            [self.scrollView addSubview:item];
            item.text = titles[i];
            item.tag = i + 1;
            item.textAlignment = NSTextAlignmentCenter;
            item.userInteractionEnabled = YES;
            [item addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemTapGest:)]];
            [item setFont:[UIFont systemFontOfSize:22]];
        }
    }
    
    // 位置
//    if (self.titles.count) {
//        self.scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - kLineHeight);
//        self.scrollView.contentSize = CGSizeMake(60 * self.titles.count+30, self.scrollView.frame.size.height - kLineHeight);
//        CGFloat btnW = (self.scrollView.contentSize.width-30) / self.titles.count;
//        for (int i = 0 ; i < self.titles.count; i++) {
//            NHHomeHeaderOptionalViewItemView *item = (NHHomeHeaderOptionalViewItemView *)[self.scrollView viewWithTag:i + 1];
//            item.frame = CGRectMake(btnW * i, 0, btnW, self.scrollView.frame.size.height);
//        }
//    }
    //新位置
    if (self.titles.count) {
        self.scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - kLineHeight);
        self.scrollView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height - kLineHeight);
        CGFloat btnW = (self.scrollView.contentSize.width) / 6;
        for (int i = 0 ; i < self.titles.count; i++) {
            if (i>10) {
                break;
            }
            NHHomeHeaderOptionalViewItemView *item = (NHHomeHeaderOptionalViewItemView *)[self.scrollView viewWithTag:i + 1];
            if (i<6) {
                item.frame = CGRectMake(btnW * i, 0, btnW, 40);
            }else{
                item.frame = CGRectMake(btnW * (i-6), 40, btnW, 40);
            }
        }
    }
    
    if (self.titles.count > 5) {
        // 两行的中间分割线
        self.middleLineLayer.frame = CGRectMake(0, self.scrollView.frame.size.height/2 - kLineHeight, self.scrollView.contentSize.width<kScreen_width?kScreen_width:self.scrollView.contentSize.width, kLineHeight);
    }
    // 底部分割线
    self.lineLayer.frame = CGRectMake(0, self.scrollView.frame.size.height - kLineHeight, self.scrollView.contentSize.width<kScreen_width?kScreen_width:self.scrollView.contentSize.width, kLineHeight);
}

// 点击item执行回调
- (void)itemTapGest:(UITapGestureRecognizer *)tapGest {
    NHHomeHeaderOptionalViewItemView *item = (NHHomeHeaderOptionalViewItemView *)tapGest.view;
    if (item) {
        
        if (self.homeHeaderOptionalViewItemClickHandle) {
            self.homeHeaderOptionalViewItemClickHandle(self, item.text, item.tag - 1);
        }
        self.currentIndex = item.tag - 1;
    }
}

- (void)scrollToChoosed:(int)selectIndex{
//    if (self.scrollView.contentSize.width<kScreen_width) {
//        return;
//    }else{
        [self.scrollView scrollRectToVisible:CGRectMake(60*selectIndex, 0,self.bounds.size.width, self.bounds.size.height - kLineHeight) animated:YES];
//    }
}

- (void)itemSelect:(int)selectIndex{
    if (self.homeHeaderOptionalViewItemClickHandle) {
        self.homeHeaderOptionalViewItemClickHandle(self, @"", selectIndex);
    }
    self.currentIndex = selectIndex;
}

- (UIScrollView *)scrollView {
    if(!_scrollView){
        UIScrollView *sc = [[UIScrollView alloc] init];
        sc.delegate = self;
        [self addSubview:sc];
        _scrollView = sc;
        sc.backgroundColor = [UIColor clearColor];
        sc.showsVerticalScrollIndicator = NO;
        sc.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (CALayer *)lineLayer {
    if (!_lineLayer) {
        CALayer *line = [CALayer layer];
        [self.scrollView.layer addSublayer:line];
        line.backgroundColor = kSeperatorColor.CGColor;
        _lineLayer = line;
    }
    return _lineLayer;
}

- (CALayer *)middleLineLayer {
    if (!_middleLineLayer) {
        CALayer *line = [CALayer layer];
        [self.scrollView.layer addSublayer:line];
        line.backgroundColor = kSeperatorColor.CGColor;
        _middleLineLayer = line;
    }
    return _middleLineLayer;
}

@end
