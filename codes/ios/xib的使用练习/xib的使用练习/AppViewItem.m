//
//  AppViewItem.m
//  xib的使用练习
//
//  Created by to-explore-future on 17/11/14.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "AppViewItem.h"

@interface AppViewItem ()
@property (weak, nonatomic) IBOutlet UIImageView    *imageView;
@property (weak, nonatomic) IBOutlet UILabel        *appName;
@property (weak, nonatomic) IBOutlet UIButton       *button_download;

@end

@implementation AppViewItem

- (void)setModel:(AppViewModel *)model{
    NSString * imageName = model.icon;
    NSLog(@"imageName = %@",imageName   );
    self.imageView.image = [UIImage imageNamed:imageName];
    self.appName.text    = model.name;
}

@end
