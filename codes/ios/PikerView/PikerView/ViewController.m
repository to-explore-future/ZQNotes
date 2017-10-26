//
//  ViewController.m
//  PikerView
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPickerView *picker = [[UIPickerView alloc]init];
    picker.frame = CGRectMake(0, 0, 400, 600);
    
    picker.delegate = self;
    picker.dataSource = self;
    
    [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0){
        return 5;
    }else if(component == 1){
        return 10;
    }else if(component == 2){
        return 20;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString * str = [NSString stringWithFormat:@"%li组%li行",component,row];
    return str;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 150;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 100;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    NSString * name = [NSString stringWithFormat:@"aa.png"];
    UIImage *im = [UIImage imageNamed:name];
    UIImageView *iv = [[UIImageView alloc] initWithImage:im];
    return iv;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
