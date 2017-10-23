//
//  ViewController.m
//  手势 旋转 与 缩放
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
    
    UIImage * image = [UIImage imageNamed:@"006.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc ]initWithImage:image];
    imageView.frame = CGRectMake(100, 180, 120, 200);
    
    [self.view addSubview:imageView];

    //是否可以和用户交互
    imageView.userInteractionEnabled = YES;

    _pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    //将捏合手势 添加到 视图中
    [imageView addGestureRecognizer:_pinchGR];
    
    _rotationGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [imageView addGestureRecognizer:_rotationGR];
    
    //使用代理中的方法 的前提是添加代理啊
    _rotationGR.delegate = self;
    _pinchGR.delegate = self;
    
}

- (void) pinchAction:(UIPinchGestureRecognizer* ) pinch{
   UIImageView * imageView = (UIImageView *) pinch.view;
    // 什么乱七八糟的矩阵，去他的 ，就是 一个矩形框中 一堆像素，如果缩放 每个像素应该变成什么颜色
    imageView.transform = CGAffineTransformScale(imageView.transform, pinch.scale, pinch.scale );
    //这句代码的作用？？？
    pinch.scale = 1;
}

- (void) rotationAction:(UIRotationGestureRecognizer*)rotation{
    UIImageView * imageView = (UIImageView *) rotation.view;
    imageView.transform = CGAffineTransformRotate(imageView.transform, rotation.rotation);
    rotation.rotation = 0;
}

//是否两个手势识别器同时工作
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
