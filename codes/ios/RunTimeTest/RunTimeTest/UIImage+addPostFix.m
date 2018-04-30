//
//  UIImage+addPostFix.m
//  RunTimeTest
//
//  Created by sharingmobile on 2018/4/28.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "UIImage+addPostFix.h"

@implementation UIImage (addPostFix)

/**
 *  UIImage中 有一个方法 setImage 项目中所有的使用这个方法的地方 都是传入了一个
 *  图片的名称,但是后来 公司为了命名规范,所有的以前的图片的名称都按照某种规律
 *  变成了新的名称,
 *  公司需求,针对现在的项目,为了适配iPhoneX 专门做了一套图片,如果仅仅是一两个地方
 *  需要改 这也无所谓,但是如果项目中 有一两千的地方都需要改,这就麻烦了
 *  但是所有的需要改动的地方 都调用了系统的 imageName 这个方法,
 *  这个时候 我如果扩展系统的SDK的源码(开闭原则),那么我只需要扩展源码,而不用改动成千上万的地方
 */

+ (UIImage *)zq_imageNamed(NSString *)name{
    
}


@end
