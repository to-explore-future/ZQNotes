//
//  NextTest.m
//  关于高德地图 demo
//
//  Created by 869518570@qq.com on 17/12/13.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "NextTest.h"
#import <AMapNaviKit/AMapNaviKit.h>
#import "Masonry.h"

@interface NextTest ()<MAMapViewDelegate>

@property(nonatomic,strong)MAMapView * mapview;
@property(nonatomic,strong)UIButton * back;

@end

@implementation NextTest

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    // Do any additional setup after loading the view.
//    [self.view addSubview:self.mapview];
//    [self.mapview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(self.view);
//        make.top.mas_equalTo(self.view.mas_top).offset(20);
//    }];
//    [self.view addSubview:self.back];
//    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(self.view).offset(10);
//    }];
}

-(MAMapView *)mapview{
    if (_mapview == nil) {
        _mapview = [[MAMapView alloc]init];
//        _mapview.mapType = MAMapTypeStandard;
        _mapview.delegate = self;
    }
    return _mapview;
}

-(UIButton *)back{
    if (_back == nil) {
        _back = [[UIButton alloc]init];
        [_back setTitle:@"返回" forState:UIControlStateNormal];
        [_back setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_back sizeToFit];
        [_back addTarget:self action:@selector(adfadjf) forControlEvents:UIControlEventTouchUpInside];
    }
    return _back;
}

-(void)adfadjf{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
