//
//  ViewController.m
//  CheckBoxDemo
//
//  Created by to-explore-future on 17/12/6.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "BEMCheckBox.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BEMCheckBox *checkBox;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.checkBox.onAnimationType = BEMAnimationTypeBounce;
    self.checkBox.offAnimationType = BEMAnimationTypeBounce;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
