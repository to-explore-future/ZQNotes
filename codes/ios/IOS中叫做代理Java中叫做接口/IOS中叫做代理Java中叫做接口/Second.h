//
//  Second.h
//  IOS中叫做代理Java中叫做接口
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>


//定义代理的 几个步骤
/*
 1.代理是用来传值的，用来回调的，从哪里开始传值，从哪里开始回调，代理就写到那个 类所在的文件中。
 2.在需要传值的类 .h 中，定义一个代理的变量， 到 .m中调用代理的方法，
 3.在需要接收值的类中，创建一个 需要传值的类的对象，把需要接收值的 对象（self）赋值给需要传值的对象中的定义好的代理的引用。
 4.总结：代理就是Android，java中的接口，定义接口 一个类实现，然后回调。
 */
@protocol SecondDelegate <NSObject>

- (void)changeColor:(UIColor*)color;

@end

@interface Second : UIViewController

@property id<SecondDelegate> delegete;

@end
