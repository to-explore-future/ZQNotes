//
//  Test.m
//  OneObjectPushSelfTest
//
//  Created by sharingmobile on 2018/3/20.
//  Copyright © 2018年 zq. All rights reserved.
//

#import "Test.h"

@interface Test ()

@property(nonatomic,strong)UIButton * next;

@end

@implementation Test

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.next];
}


-(void)nextAciton{
    Test * test = [[Test alloc] init];
    [test setTitle:@"test1"];
    [self.navigationController pushViewController:test animated:YES];
    
}

-(UIButton *)next{
    if (_next == nil) {
        _next = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
        [_next setTitle:@"下一页" forState:UIControlStateNormal];
        [_next setBackgroundColor:[UIColor purpleColor]];
        [_next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_next addTarget:self action:@selector(nextAciton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _next;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
