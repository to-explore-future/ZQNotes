//
//  ImageShow.h
//  照片墙
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageShow : UIViewController{
//    UIImageView * _iv;
    UIImage * _image;
    NSInteger _imageTag;
}
//@property(nonatomic,retain)UIImageView * iv;
@property(nonatomic,retain) UIImage * image;
@property(assign) NSInteger imageTag;
@end
