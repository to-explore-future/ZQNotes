//
//  ViewController.m
//  UIScrollView
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
    //获取屏幕的宽高
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSInteger screenWidth = 320;
    NSInteger screenHeight = 570;
    NSLog(@"宽:%d,高:%d",screenWidth,screenHeight);
    
    scrollView = [[UIScrollView alloc] init];
    
    scrollView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    
    scrollView.backgroundColor = [UIColor orangeColor];
    //是否以单页的形式进行 跳转
    scrollView.pagingEnabled = YES;
    //滑到最后的时候 是否有跳动动画，如果没有 是拉不动的
    scrollView.bounces = YES;
    //显示内容的 大小
    
//    scrollView.contentSize = CGSizeMake(screenWidth*5, screenHeight);
    scrollView.contentSize = CGSizeMake(screenWidth, screenHeight*5);
    //是否可以滑动
    scrollView.scrollEnabled = YES;
    //到达边缘是 是否有垂直跳动的 动画
    scrollView.alwaysBounceVertical = NO;
    //是否有水平跳动的动画，这个貌似不起作用
    scrollView.alwaysBounceHorizontal = YES;
    //显示滚动条，进度条 ，只有在相同的方向上 当内容页大于控件的尺寸是 才会有进度条
    scrollView.showsHorizontalScrollIndicator = YES;
    
    scrollView.showsVerticalScrollIndicator = YES;
    
    for (int i = 4; i < 9; i++) {
        NSString * ivName = [NSString stringWithFormat:@"00%d.jpg",i];
        //UIImage不是一个View
        UIImage * iv = [UIImage imageNamed:ivName];
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:iv];
//        ivImage.frame = CGRectMake(screenWidth*(i - 4), 0, screenWidth, screenHeight);
        ivImage.frame = CGRectMake(0, screenHeight*(i -4), screenWidth, screenHeight);
        [scrollView addSubview:ivImage];
    }
    
    [self.view addSubview:scrollView];
    
    scrollView.contentOffset = CGPointMake(0, 0);
    
    scrollView.delegate = self;
    
    //scrollView 还有一堆代理方法 回调方法 ，大致都和Android 一样
 
}

//点击空白位置的时候 让scrollView 回到指定位置
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   //scrollView.contentOffset= CGPointMake(0, 0);
    [scrollView scrollRectToVisible:CGRectMake(0, 0, 320, 570) animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
