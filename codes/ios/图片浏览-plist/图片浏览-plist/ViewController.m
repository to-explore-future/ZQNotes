//
//  ViewController.m
//  图片浏览-plist
//
//  Created by to-explore-future on 17/11/11.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIImageView    *image;
@property (weak, nonatomic) IBOutlet UILabel        *imageDetail;
@property (weak, nonatomic) IBOutlet UILabel        *imageName;
@property(nonatomic,strong) NSArray                 *array;
@property(nonatomic,assign) NSInteger                index;

- (IBAction)preImage: (UIButton *)sender;
- (IBAction)nextImage:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"images" ofType:@".plist"];
    self.array = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"count = %@",self.array);
    NSDictionary    * dic       = [self.array firstObject];
    NSString        * imageName = dic[@"imageName"];
    UIImage         * image     = [ UIImage imageNamed:imageName];
    [self.image setImage:image];
    self.index = 0;
    
}


- (IBAction)preImage:(UIButton *)sender {
    self.index--;
    if (self.index < 0) {
        self.index++;
        return;
    }
    
    NSDictionary *dic = self.array [self.index];
    NSString * name = dic[@"imageName"];
    UIImage *image = [UIImage imageNamed:name];
    [self.image setImage:image];
    
    //设置名字
}

- (IBAction)nextImage:(UIButton *)sender {
    self.index++;
    NSInteger count = self.array.count;
    if (self.index >= count) {
        self.index--;
        return;
    }
    
    NSDictionary *dic = self.array [self.index];
    NSString * name = dic[@"imageName"];
    UIImage *image = [UIImage imageNamed:name];
    [self.image setImage:image];
}
@end
