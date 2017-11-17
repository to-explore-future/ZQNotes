//
//  ViewController.m
//  Tom猫
//
//  Created by to-explore-future on 17/11/13.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tomCat;
- (IBAction)drink:(UIButton *)sender;

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


- (IBAction)drink:(UIButton *)sender {
//    [self method1];
    [self actionwithImageName:@"drink_%02ld.jpg" withImageCount:81 animationDuration:4.5];
}

-(void)actionwithImageName:(NSString*)imageName withImageCount:(NSInteger)count animationDuration:(NSInteger)duration{
    NSMutableArray * array = [NSMutableArray array];
    for (NSInteger i = 0 ; i < count; i++) {
        NSString * catName = [NSString stringWithFormat:imageName,i];
        NSString * filePath = [[NSBundle mainBundle] pathForResource:catName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [array addObject:image];
    }
    self.tomCat.animationImages = array;
    self.tomCat.animationRepeatCount = 1;
    self.tomCat.animationDuration = duration;
    [self.tomCat startAnimating];
    
    [self.tomCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:duration] ;
}

-(void)method1{
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0 ; i < 81 ; i++) {
        NSString * picName = [NSString stringWithFormat:@"drink_%02d.jpg",i];
        //这种方式会把图片缓存到内存中，即时销毁了集合的引用 缓存依然不能得到释放，
        //这种结果是 uiImage这个类的 特性导致，
        UIImage * image = [UIImage imageNamed:picName];
        [array addObject:image];
    }
    self.tomCat.animationImages = array;
    self.tomCat.animationDuration = 5;
    self.tomCat.animationRepeatCount = 1;
    [self.tomCat startAnimating];
}
@end
