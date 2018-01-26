//
//  ViewController.m
//  关于高德地图 demo
//
//  Created by 869518570@qq.com on 17/12/13.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import <AMapNaviKit/AMapNaviKit.h>
#import "Masonry.h"
#import "NextTest.h"
#import "SVc.h"

@interface ViewController ()<MAMapViewDelegate>

@property(nonatomic,strong)UILabel * name;
@property(nonatomic,strong)MAMapView * mapview;
@property(nonatomic,strong)UIButton * jump;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self initFrame];
}



-(void)initFrame{
//    [self.view addSubview:self.name];
//    [self.view addSubview:self.mapview];
    [self.view addSubview:self.jump];
    
//    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).offset(15);
//        make.top.mas_equalTo(self.view).offset(15);
//    }];
    
    [self.jump mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
    }];
    
//    [self.mapview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).offset(15);
//        make.top.mas_equalTo(self.name.mas_bottom).offset(10);
//        make.right.mas_equalTo(self.view).offset(-15);
//        make.height.mas_equalTo(200);
//    }];
    
}


-(UILabel *)name{
    if (_name == nil) {
        _name = [[UILabel alloc]init];
        [_name setText:@"高德地图"];
        [_name sizeToFit];
    }
    return _name;
}

-(MAMapView *)mapview{
    if (_mapview == nil) {
        _mapview = [[MAMapView alloc]initWithFrame:self.view.bounds];
        _mapview.mapType = MAMapTypeStandard;
        _mapview.delegate = self;
    }
    return _mapview;
}

-(UIButton *)jump{
    if (_jump == nil) {
        _jump = [[UIButton alloc] init];
        [_jump setTitle:@"打开下一个" forState:UIControlStateNormal];
        [_jump addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
        [_jump setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_jump sizeToFit];
    }
    return _jump;
}

-(void)next{
    
//    NextTest * next = [[NextTest alloc]init];
//    next.view.backgroundColor = [UIColor greenColor];
    
    SVc * svc = [[SVc alloc]init];
    [self presentViewController:svc animated:NO completion:^{
    }];
//    ViewController *vc = [[ViewController alloc]init];
//    UINavigationController * nv = [[UINavigationController alloc]initWithRootViewController:vc];
//    [nv pushViewController:next animated:YES];
}




-(void)dealloc{
    _mapview = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
