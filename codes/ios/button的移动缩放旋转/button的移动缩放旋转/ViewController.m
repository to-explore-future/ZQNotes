//
//  ViewController.m
//  button的移动缩放旋转
//
//  Created by to-explore-future on 17/11/11.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *image;
- (IBAction)move:(UIButton *)sender;
- (IBAction)scale:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)move:(UIButton *)sender {
    CGRect frame = self.image.frame;
    NSInteger tag = sender.tag;
    NSLog(@"tag = %ld",tag);
    switch (tag) {
        case 10:
            frame.origin.y -= 10;
            break;
            
        case 20:
            frame.origin.x -= 10;
            break;
            
        case 30:
            frame.origin.y += 10;
            break;
            
        case 40:
            frame.origin.x += 10;
            break;
            
        default:
            break;
    }
    
    self.image.frame = frame;
    
    [self test];
}

- (IBAction)scale:(UIButton *)sender {
    
//    CGRect frame = self.image.frame;
//        CGPoint center = self.image.center;
//    NSInteger tag = sender.tag;
//    switch (tag) {
//        case 50:
//            
//            frame.size.width    += 10;
//            frame.size.height   += 10;
//            break;
//            
//        case 60 :
//            frame.size.width  -= 10;
//            frame.size.height -= 10;
//            break;
//            
//        default:
//            break;
//    }
//    
//    self.image.frame = frame;
//    self.image.center = center;
//
    
    //bounds 这个属性是 没有起始点  默认按照图片的中心 作为参考坐标
    CGRect bounds   = self.image.bounds;
//    CGSize size     = bounds.size;
//    CGPoint origin  = bounds.origin;
    NSInteger tag = sender.tag ;
    switch (tag) {
        case 50:
            bounds.size.width  += 10;
            bounds.size.height += 10;
            break;
            
        case 60:
            bounds.size.width  -= 10;
            bounds.size.height -= 10;
            
        default:
            break;
    }
    
    self.image.bounds = bounds;

}

- (void) test{
    CGRect bounds   = self.image.bounds;
    CGSize size     = bounds.size;
    CGPoint origin  = bounds.origin;
    NSLog(@"bounds %@",NSStringFromCGSize(size));
    NSLog(@"origin %@",NSStringFromCGPoint(origin));
    
    
}


@end
