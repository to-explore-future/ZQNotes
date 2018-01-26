//
//  SVc.m
//  关于高德地图 demo
//
//  Created by 869518570@qq.com on 17/12/13.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "SVc.h"
#import "Masonry.h"
#import <AMapNaviKit/AMapNaviKit.h>

@interface SVc ()

@property(nonatomic,strong)UIButton * back;
@property(nonatomic,strong)MAMapView * mapview;

@end

@implementation SVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.back];
    [self.back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(10);
        make.top.mas_equalTo(self.view).offset(20);
    }];
    
    [self.view addSubview:self.mapview];
    [self.mapview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(self.view.bounds.size.height - 100);
    }];
}

-(UIButton *)back{
    if (_back == nil) {
        _back = [[UIButton alloc]init];
        [_back setTitle:@"返回" forState:UIControlStateNormal];
        [_back setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_back addTarget:self action:@selector(togoback) forControlEvents:UIControlEventTouchUpInside];
        [_back sizeToFit];
    }
    return _back;
}

-(MAMapView *)mapview{
    if (_mapview == nil) {
        _mapview = [[MAMapView alloc]initWithFrame:self.view.bounds];
        _mapview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _mapview;
}

-(void)togoback{
   [self dismissViewControllerAnimated:NO completion:^{
   }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
