//
//  ViewController.m
//  扩展手势
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
    // Do any additional setup after loading the view, typically from a nib.
    //这一节主要就是处理 结果手势
    /*
     UIPan
     UISwipe
     UILongPress
     */
    
    UIImage * image = [UIImage imageNamed:@"006.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.frame = CGRectMake(100, 150, 120, 200);
    
    [self.view addSubview:imageView];
    
    //手势处理 这种就是与用户交互  要来交互
    imageView.userInteractionEnabled = YES;
    //移动手势函数 移动距离 移动速度
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    //问题：为什么这里设置成 2 就无法识别
//    pan.minimumNumberOfTouches = 2;
//    pan.maximumNumberOfTouches = 2;
    [imageView addGestureRecognizer:pan];
    [imageView removeGestureRecognizer:pan];
    
    
    //滑动手势函数
    UISwipeGestureRecognizer * swipe ;
   /*
    让滑动手势 识别四个方向
    */
    //1.把四个方向值 放到 数组中 ,这种数组要加 @ ？
    NSArray * swipeDirectionArray = @[@(UISwipeGestureRecognizerDirectionRight),@(UISwipeGestureRecognizerDirectionLeft),@(UISwipeGestureRecognizerDirectionUp),@(UISwipeGestureRecognizerDirectionDown)];
    
    //2.给一个View添加四个 手势识别器
    for (NSNumber *number in swipeDirectionArray) {
        swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
        swipe.direction = [number integerValue];
        [imageView addGestureRecognizer:swipe];
    }
    
    
    /*
     再来一个长按手势
     */
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    [imageView addGestureRecognizer:longPress];
    
    
    
}

//longPress 有两个状态  长按开始  长按结束
- (void) longPressAction:(UILongPressGestureRecognizer* ) longPress{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按开始");
    }else if(longPress.state == UIGestureRecognizerStateEnded){
        NSLog(@"长按结束");
    }
}

- (void) swipeAction:(UISwipeGestureRecognizer*) swipe{
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"向上移动");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"向下移动");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"向左移动");
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"向右移动");
            break;
        default:
            break;
    }
}

- (void)panAction:(UIPanGestureRecognizer*)pan{
    
//    NSLog(@"触发");
//    //获取移动的坐标
//    /*
//     经过测试 ，发现这个是 获取 现在触碰的位置 与 第一触碰点 之间的距离。不带绝对值。
//     */
//    CGPoint pt = [pan translationInView:self.view];
//    NSLog(@"pt.x = %.2f,pt.y = %.2f",pt.x,pt.y);
//    
//    //能够检测 水平 竖直方向的 速度 不带绝对值
//    CGPoint velocity = [pan velocityInView:self.view];
//    NSLog(@"velocity.x = %.2f,velocity.y = %.2f",velocity.x,velocity.y);
//    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
