//
//  Person.h
//  Object_c
//
//  Created by to-explore-future on 17/10/16.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    NSInteger _age;
}

- (id) init;
- (void) setName:(NSString *)name;
- (void) setAge:(NSInteger)age;
- (void) setName:(NSString*)name andAge:(NSInteger)age;

- (NSString *) name;
- (NSInteger) age;

- (void) print;

+ (void)testPerson;

@end
