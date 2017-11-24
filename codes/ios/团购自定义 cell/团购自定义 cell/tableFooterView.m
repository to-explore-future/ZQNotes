//
//  tableFooterView.m
//  团购自定义 cell
//
//  Created by to-explore-future on 17/11/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "tableFooterView.h"

@interface tableFooterView ()

@property (weak, nonatomic) IBOutlet UIButton   *loadMore;
@property (weak, nonatomic) IBOutlet UIView     *loadingView;
- (IBAction)loadMoreClick:(id)sender;



@end


@implementation tableFooterView



- (IBAction)loadMoreClick:(id)sender {
   //当点击这个按钮的时候，去网络请求数据 ，然后把新的数据 加载到集合 然后显示出来
    //1.显示正在加载
    [self.loadingView setHidden:NO];
    
    //2.去网络请求数据 这里模拟一下
    //生成一个模型数据，添加到 数组中 在 Android 中当需要一个对象的时候 可以使用构造方法传入这个对象，
    //对对象的操作都是指针 远程控制对象，所以多来几个指针 没关系
    
    //隔一段时间执行代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //首先判断 代理对象是否实现了代理方法
        if ([self.delegate respondsToSelector:@selector(tableFooterViewUpdateData:)]) {
            [self.delegate tableFooterViewUpdateData:self];
            
            [self.loadingView setHidden:YES];
            //执行完毕之后把 footerView 显示出来
            
        }
    });
    
}
@end
