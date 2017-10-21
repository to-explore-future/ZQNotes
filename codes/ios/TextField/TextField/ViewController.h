//
//  ViewController.h
//  TextField
//
//  Created by to-explore-future on 17/10/21.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    UITextField * _textField;//类似于Android EditText
}

@property(nonatomic,strong)UITextField * textField;

@end

