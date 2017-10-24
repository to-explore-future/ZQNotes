//
//  VCRoot.h
//  XIB手动创建
//
//  Created by to-explore-future on 17/10/24.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCRoot : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *mLUserName;
@property (weak, nonatomic) IBOutlet UILabel *mLPassWord;
@property (weak, nonatomic) IBOutlet UITextField *mTFUserName;
@property (weak, nonatomic) IBOutlet UITextField *mTFPassWord;
@property (weak, nonatomic) IBOutlet UIButton *mBtnRegister;
@property (weak, nonatomic) IBOutlet UIButton *mBtnLogin;

- (IBAction)login:(UIButton *)sender;



- (IBAction)recc:(UIButton *)sender;




@end
