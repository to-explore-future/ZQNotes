//
//  ViewController.m
//  UIGusture
//
//  Created by to-explore-future on 17/10/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 单机操作 双击操作 对图片的方法缩小
    UIImage *image = [UIImage imageNamed:@"006.jpg"];
    _imageView=  [[UIImageView alloc] initWithImage:image];
    _imageView.frame = CGRectMake(50, 50, 120, 200);
    [self.view addSubview:_imageView];
    
    
    //手势事件是给 View添加的
    
    //任何一个View 都要首先打开手势响应事件,默认是 NO
    _imageView.userInteractionEnabled = YES;
    //点击手势识别器 第一个
    UITapGestureRecognizer * tapOneGus = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOne:)];

    //以下 是 UITapGustureRecoginzer 中的两个仅有的变量
    //如果手势识别器打开了 这两个的默认值都是 1，看需求设置值
    tapOneGus.numberOfTapsRequired = 1;
    tapOneGus.numberOfTouchesRequired = 1;
    
    //给 View添加一个 手势识别器 当然一个View可以添加 多个手势识别器，
    //当时有手势事件的时候， 满足条件的手势事件都会被触发
    [_imageView addGestureRecognizer:tapOneGus];
    
    //接着添加一个 双加 图片 缩回去
    UITapGestureRecognizer * tapTwoGus = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwo:)];
    tapTwoGus.numberOfTapsRequired = 2;
    tapTwoGus.numberOfTouchesRequired =1;
    [_imageView addGestureRecognizer:tapTwoGus];
    
    //当双击的时候 第一次 系统认为是 单机了 说以回调了 单机的响应函数
    //所已当 有双击 和 单击响应函数同时存在的时候，系统会首先去执行单击的回调函数
    //然后突然 又变成双击 又去执行双加的 回调函数 ，所以就会导致 图片显示变大变小
    // 正常思路是 给用户个时间 让用户释放自己的意图， 判断结束 之后 再去判断用户
    // 的真正的意图
    
    //按照 源码对这个方法的介绍 走了这个方法之后呢，系统会把这两个识别器 添加一个
    //关联，就是当第一个手势识别器 启动之后呢，这个时候如果第二个手势识别器也启动了
    //这个手就让第一个手势识别器 走 onFailed方法
    [tapOneGus requireGestureRecognizerToFail:tapTwoGus];//手势一 对于 手势二 会走这个方法
    
    
    //按照这个逻辑 如果同时有 三击的 双击的 单机的 操作的 那么
    /*
     [tapTwoGus requireGestureRecognizerToFail:tapThreeGus];
     [tapOneGus requireGestureRecognizerToFail:tapThreeGus];
     */
    
    
    //我测来测去 底层搞不好 就是 添加了个 等待时间
}

//当手势识别器 被触发时 回掉这个方法
- (void) tapOne:(UITapGestureRecognizer*) tap{
    NSLog(@"第二次单击的时候 这个函数响应了吗 ");
    //来一个图片的放大
    UIImageView *imageView = (UIImageView*) tap.view;
    [UIView beginAnimations:nil context:nil];
    imageView.frame = CGRectMake(0, 0, 320, 570);
    [UIView commitAnimations];
}

- (void)tapTwo:(UITapGestureRecognizer*) tap{
    UIImageView *imageView = (UIImageView*)tap.view;
    [UIView beginAnimations:nil context:nil];
    imageView.frame = CGRectMake(50, 50, 120, 200);
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
