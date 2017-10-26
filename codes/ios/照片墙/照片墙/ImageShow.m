//
//  ImageShow.m
//  照片墙
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ImageShow.h"

@interface ImageShow ()

@end

@implementation ImageShow

//@synthesize iv = _iv;
@synthesize image = _image;
@synthesize imageTag = _imageTag;

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    /*
     导航栏默认是半透明的，这是图片的绘制起始位置是屏幕的左上角，导航栏挡住了图片的一部分，
     给导航栏设置一个 自定义的颜色，
     */
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //获取 状态栏 和 导航栏的高度
    NSInteger statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    NSInteger navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    NSInteger startHeight= statusHeight + navigationBarHeight;
    NSLog(@"高度：%li",startHeight);
    NSInteger width = size.width;
    NSInteger height = size.height;
    //初始化成员变量
//    _iv = [[UIImageView alloc] initWithFrame:CGRectMake(0,startHeight, width, height)];
//    _iv.image = _image;
    /*
     上面提到过了，一个View只能够有一个父View
     这中思想 在Android 中也是适用的 ，不过在android中 如果出现一个View有两个View程序会挂掉，
     所以 UIImageView是不可以 传递的
     */
//    _iv.frame = CGRectMake(0, startHeight, width, height  );
    self.navigationItem.title = @"图片展示";
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     使用tag
     */
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,startHeight, width, height)];
    NSString * name = [NSString stringWithFormat:@"00%li.jpg",(_imageTag - 105)];
    imageView.image = [UIImage imageNamed:name];
//            CGFloat fixelW = CGImageGetWidth(imageView.image.CGImage);
//            CGFloat fixelH = CGImageGetHeight(imageView.image.CGImage);
//            NSLog(@"图片的宽度：%.2f,高度%.2f",fixelW,fixelH);
    self.view.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    NSLog(@"系统内存不足");
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"将要展示");
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"将要消失");
}

- (void)dealloc{
    NSLog(@"退出");
//    _image = nil;
   
}



@end
