//
//  tableFooterView.h
//  团购自定义 cell
//
//  Created by to-explore-future on 17/11/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

// 这里我要 在这个类中添加一个 cellModel 数据 ，但是数组没有在这个类中，
//要么把包含数组的按个类传入进来，不建议 耦合性太强
//要么 搞一个代理

/**
 *  <#Description#>
 */
@class tableFooterView;

@protocol tableFooterViewDelegate <NSObject>

//我这个代理协议要规定 实现这个协议的 的代理 应该做什么
//我要包含数组的代理 把我这里生成的 goodsModel 添加到数组中
-(void)tableFooterViewUpdateData:(tableFooterView *)tableFooterView;

@end

@interface tableFooterView : UIView

@property(nonatomic,weak)id<tableFooterViewDelegate> delegate;

+(instancetype)getInstance;

@end
