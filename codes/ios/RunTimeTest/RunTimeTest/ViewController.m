//
//  ViewController.m
//  RunTimeTest
//
//  Created by sharingmobile on 2018/4/28.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UIImage+addPostFix.h"
#import "NSObject+Category.h"

@interface ViewController ()

@property(nonatomic,strong)UIImageView * image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [Person eat];
    [Person run];
    
    Person * p = [[Person alloc] init];
    [p drink];
    [p sleep];
    [p getAllIvars];
    
    [self.view addSubview:self.image];
    
    NSObject * objc = [[NSObject alloc] init];
    objc.name = @"战三";
    NSString * aa = objc.name;
    
    //题
    //非主线程更新UI
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    lable.text = @"start";
    [self.view addSubview:lable];
    
    NSOperationQueue * backgroundQueue = [[NSOperationQueue alloc] init];
    [backgroundQueue addOperationWithBlock:^{
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:4]];
        lable.text = @"ready to go !";
        NSLog(@"接发就发了的方法");
    }];
    
    
    
    
}

-(UIImageView *)image{
    if(_image == nil){
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, 300, 150)];
        [_image setImage:[UIImage imageNamed:@"test"]];
    }
    return _image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
