//
//  MyLayout.h
//  自定义流式布局
//
//  Created by to-explore-future on 17/12/8.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLayout : UIView

/**
 *  设置数据源
 */
-(void)setData:(NSArray<NSString *> *)datas;

/**
 *  一定要初始化
 */
-(void)initData;

/**
 *  设置字体大小
 */
-(void)setTextFont:(UIFont *)font;

/**
 *  设置行间距
 */
-(void)setLinespace:(CGFloat)lineSpace;

/**
 *  设置列间距
 */
-(void)setRowspace:(CGFloat)rowSpace;

/**
 *  设置元素的 paddingLeft
 */
-(void)setElementPaddinLeft:(CGFloat)paddingLeft;

/**
 *  设置元素的 paddingRight
 */
-(void)setElementPaddinRight:(CGFloat)paddingRight;

/**
 *  设置元素的 paddingTop
 */
-(void)setElementPaddinTop:(CGFloat)paddingTop;

/**
 *  设置元素的 paddingBottom
 */
-(void)setElementPaddinBottom:(CGFloat)paddingBottom;

/**
 *  设置 self 的 padding
 */
-(void)setSelfPadding:(CGFloat)padding;


@end
