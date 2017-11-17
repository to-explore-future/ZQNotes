//
//  ViewController.m
//  照片墙
//
//  Created by to-explore-future on 17/10/25.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "ImageShow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏
    self.navigationItem.title = @"照片墙";
//    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
//    self.navigationController.navigationBar.translucent = NO;
    //隐藏导航栏
//    self.navigationController.navigationBarHidden = YES;
    CGSize size = [UIScreen mainScreen].bounds.size;
    //屏幕的宽高
    NSInteger width = size.width;
    NSInteger height = size.height;
    UIScrollView * sv = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    sv.backgroundColor = [UIColor orangeColor];
    sv.contentSize = CGSizeMake(width, height * 2);
    sv.userInteractionEnabled = YES;
    NSInteger imageColum = 3;               //图片的列数
    NSInteger spaceBetweenImage = 5;        //两个图片之间的间距
    //图片的分辨率 480 * 800
    NSInteger imageWidth = (width - (imageColum +1)*spaceBetweenImage) / imageColum ;//图片宽度
    NSInteger imageHeight = (imageWidth * 800) / 480  ;//图片高度
    
    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSData *da = nil;
//    NSString *path_document=NSHomeDirectory();
    /*
     for循环添加照片每个图片开启交互模式，
     */
    for (int i = 0 ; i < 18; i++) {
        NSString *imageName = [NSString stringWithFormat:@"00%d.jpg",i];
        
        UIImage * image = [UIImage imageNamed:imageName];
//        NSString* imagePath = [path_document stringByAppendingString:imageName];
//        NSLog(@"imagePath = %@",imagePath);
//        da = [NSData dataWithContentsOfFile:imagePath];
//        UIImage *ima = [UIImage imageWithData:da];
        image = [self imageWithImageSimple:image scaledToSize:CGSizeMake(imageWidth, imageHeight)];
//        CGFloat fixelW = CGImageGetWidth(image.CGImage);
//        CGFloat fixelH = CGImageGetHeight(image.CGImage);
//        NSLog(@"图片的宽度：%.2f,高度%.2f",fixelW,fixelH);
        UIImageView * iv = [[UIImageView alloc] initWithImage:image];
        
        //给UIImageView 添加tag
        iv.tag = 105 + i;
        NSInteger x = i % 3;
        NSInteger y = i / 3;
        iv.frame = CGRectMake( ((spaceBetweenImage * (x + 1))+x *imageWidth), ((spaceBetweenImage * (y +1))+y *imageHeight), imageWidth, imageHeight);
        //设置交互信息
        iv.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectImage:)];
        //单次点击
        tap.numberOfTapsRequired = 1;
        //单个手指
        tap.numberOfTouchesRequired = 1;
        [iv addGestureRecognizer:tap];
        [sv addSubview:iv];
    }
    /*
     获取图片的尺寸
     CGFloat fixelW = CGImageGetWidth(image.CGImage);
     CGFloat fixelH = CGImageGetHeight(image.CGImage);
     */
    [self.view addSubview:sv];
}

- (void) selectImage:(UITapGestureRecognizer*)tap{
    NSLog(@"图片被点击");
    //打开另一个 viewController
    //把点击的图片传递过去
    UIImageView * iv = (UIImageView*)tap.view;
    ImageShow * is = [[ImageShow alloc] init];
    //一个View只能有一个父view
//    is.iv = iv;
    
    
    /*
     一个View如果已经有了父View ，那么这个View不能再有第二个父veiw
     */
    //思路：2 ,传递图片的 指针
    is.image = iv.image;
    
    //思路：3, 项目中的资源是公用的，每个viewcontroller都可以随意适用，巧妙的使用
    //给每个图片添加一个tag。有规律的添加tag，UIImageView可以携带tag，tag是一个
    //NSInteger类型的值，在ImageShow中使用 变量接收
    is.imageTag =  iv.tag;
    
    
    [self.navigationController pushViewController:is animated:YES];
    
}



//这个方法 可以把一个 UIImageView 转变成一个 新的分辨率的 UIImageView
- (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize{
    
    UIGraphicsBeginImageContext (newSize);
    
    [image drawInRect : CGRectMake ( 0 , 0 ,newSize. width ,newSize. height )];
    
    UIImage  *newImage = UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return newImage;
}

@end
