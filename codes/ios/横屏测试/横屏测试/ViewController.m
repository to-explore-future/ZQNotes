//
//  ViewController.m
//  横屏测试
//
//  Created by sharingmobile on 2018/3/9.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "ViewController.h"
#import "UIView+BLLandscape.h"

@interface ViewController ()

@property(nonatomic,strong)UIView * previewView;
@property(nonatomic,strong)UIButton * landscapeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.previewView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [self.previewView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.previewView];
    
    [self.view addSubview:self.landscapeButton];

}

-(void)toScrollAction{
    if (self.previewView.viewStatus == BLLandscapeViewStatusPortrait) {
        
        [self.previewView bl_landscapeAnimated:YES animations:^{
            
            self.landscapeButton.frame = CGRectMake(20.f, self.previewView.bounds.size.height - 80.f, self.previewView.bounds.size.width - 40.f, 50.f);
            [self.landscapeButton setTitle:@"回到竖屏" forState:UIControlStateNormal];
            
        } complete:^{
            
        }];
    }
    else if (self.previewView.viewStatus == BLLandscapeViewStatusLandscape){
        
        [self.previewView bl_protraitAnimated:YES animations:^{
            
            self.landscapeButton.frame = CGRectMake(20.f, self.previewView.bounds.size.height - 80.f, self.previewView.bounds.size.width - 40.f, 50.f);
            [self.landscapeButton setTitle:@"开始横屏" forState:UIControlStateNormal];
            
        } complete:^{
            
        }];
    }
}

-(UIButton *)landscapeButton{
    if (_landscapeButton == nil) {
        _landscapeButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
        [_landscapeButton setTitle:@"开始横屏" forState:UIControlStateNormal];
        [_landscapeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_landscapeButton addTarget:self action:@selector(toScrollAction) forControlEvents:UIControlEventTouchUpInside];
        [_landscapeButton setBackgroundColor:[UIColor blueColor]];
    }
    return _landscapeButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
