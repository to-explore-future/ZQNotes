//
//  ViewController.m
//  Copy_Strong
//
//  Created by sharingmobile on 2018/4/4.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,copy)NSMutableArray * imageaa;
@property(nonatomic,copy)NSMutableArray * bbbb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    for (NSInteger i = 0 ; i < 30; i++) {
        NSString * temp = [NSString stringWithFormat:@"假分数快递费%ld",i];
        [self.imageaa addObject:temp];
    }
    NSLog(@"走我能够法律科技股份可拉伸的街坊邻居");
    for (NSInteger i = 0 ; i < 30; i++) {
        NSString * temp = [NSString stringWithFormat:@"假分数快递费%ld",i];
        [self.bbbb addObject:temp];
    }
    NSLog(@"22222222222222222222222");
    for (NSInteger  i  = 0 ; i < self.bbbb.count; i++) {
        [self.imageaa addObject:self.bbbb[i]];
    }
    NSLog(@"333333333333333333333333");
}

-(NSMutableArray *)imageaa{
    if (_imageaa == nil) {
        _imageaa = [[NSMutableArray alloc] init];
    }
    return _imageaa;
}

-(NSMutableArray *)bbbb{
    if (_bbbb == nil) {
        _bbbb = [[NSMutableArray alloc] init];
    }
    return _bbbb;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
