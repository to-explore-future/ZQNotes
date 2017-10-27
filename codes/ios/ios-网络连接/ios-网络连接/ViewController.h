//
//  ViewController.h
//  ios-网络连接
//
//  Created by to-explore-future on 17/10/27.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
//连接之后 关于数据处理的
NSURLConnectionDataDelegate,
//关于连接的
NSURLConnectionDelegate
>{
    //连接对象
    NSURLConnection     *_connect;
    //可变数据容器
    NSMutableData       *_data;
    
}


@end

