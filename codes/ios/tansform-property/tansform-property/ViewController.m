//
//  ViewController.m
//  tansform-property
//
//  Created by to-explore-future on 17/11/11.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnImage;
- (IBAction)move;
- (IBAction)scale;
- (IBAction)rotate;
- (IBAction)back;

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

#pragma mark -
//这个移动是带着方向的
- (IBAction)move {
    CGAffineTransform transform = self.btnImage.transform;
    //这种方法只能 变化一次，这种方法的参考坐标是 依据View的原始 origin

//    transform = CGAffineTransformMakeTranslation(0, 50);
    
    transform = CGAffineTransformTranslate(transform, 0, 50);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.btnImage.transform = transform;
    }];
    
    
}

- (IBAction)scale {
    CGAffineTransform transform = self.btnImage.transform;
    transform = CGAffineTransformMakeScale(1.3, 1.3);
//    transform = CGAffineTransformScale(transform, 1.3, 1.3);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.btnImage.transform = transform;
    }];
    
    
}

- (IBAction)rotate {
    
    CGAffineTransform transform = self.btnImage.transform;
    transform = CGAffineTransformMakeRotation(M_PI_4);
//    transform = CGAffineTransformRotate(transform, M_PI_4);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.btnImage.transform = transform;
    }];
    
}

- (IBAction)back {
    [UIView animateWithDuration:0.5 animations:^{
        self.btnImage.transform = CGAffineTransformIdentity;
    }];
    
}
@end
