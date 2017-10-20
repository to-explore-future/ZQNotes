//
//  Dog.h
//  选择器类别类扩展
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    NSString * _name;
}
@property(nonatomic,copy)NSString * name;
- (void)eat;
- (void)bark:(NSNumber *) count;
-(void)printInformation;
@end
