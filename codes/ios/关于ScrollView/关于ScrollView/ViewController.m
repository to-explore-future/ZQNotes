//
//  ViewController.m
//  关于ScrollView
//
//  Created by to-explore-future on 17/11/18.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerHome.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView   * scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl  * pageControl;
@property(nonatomic,strong)          UIButton       * btnStart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 5, SCREEN_HEIGHT);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    NSLog(@"kfsdkfjakdf");
    
    for (int i = 0 ; i < 5; i++) {
        
        NSString    * imageName     = [NSString stringWithFormat:@"welcom_%02d",i+1];
//        NSString    * filePath      = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpeg"];
        UIImage     * image         = [UIImage imageNamed:imageName];
//        UIImage     * image         = [UIImage imageWithContentsOfFile:filePath];
        
        UIImageView * imageView     = [[UIImageView alloc] initWithImage:image];
        CGFloat       x             = i * SCREEN_WIDTH;
        imageView.frame             = CGRectMake( x , 0 , SCREEN_WIDTH, SCREEN_HEIGHT);
//        imageView.contentMode       = UIViewContentModeScaleAspectFill;
        [self.scrollView addSubview: imageView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    CGFloat offsetX = x + SCREEN_WIDTH / 2;
    NSInteger page = offsetX / SCREEN_WIDTH;
    if (page == 4 ) {
        if (self.btnStart == nil) {
            self.btnStart = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH * 4.5), 565, 0, 0)];
            [self.btnStart setTitle:@"开启-X星-之旅" forState:UIControlStateNormal];
            [self.btnStart addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:self.btnStart];
        }
        [UIView animateWithDuration:1.2 animations:^{
            [self.btnStart setFrame:CGRectMake((SCREEN_WIDTH * 4 + 100), 550, 175, 30)];
        }];
    }else if(page == 3 ){
        [UIView animateWithDuration:0.3 animations:^{
            [self.btnStart setFrame:CGRectMake((SCREEN_WIDTH * 4 + 187.5), 565, 0, 0)];
        }];
    }
    [self.pageControl setCurrentPage:page];
}

-(void)startClick{
    ViewControllerHome * home = [[ViewControllerHome alloc] init];
    [self presentViewController:home animated:YES completion:nil];
}


@end
