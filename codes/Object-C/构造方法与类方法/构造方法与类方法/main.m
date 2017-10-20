//
//  main.m
//  构造方法与类方法
//
//  Created by to-explore-future on 17/10/16.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Book *book3 = [Book bookCreat];
        NSLog(@"name = %@,price = %.2f",[book3 name],[book3 price]);
        
        Book *book4 = [Book bookCreatWithName:@"平凡的世界" andPrice:55.55];
        NSLog(@"name = %@,price = %.2f",[book4 name],[book4 price]);
    }
    return 0;
}
