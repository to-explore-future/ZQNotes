//
//  Person.h
//  点语法
//
//  Created by to-explore-future on 17/10/19.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    NSInteger _age;
    NSString *_address;
    NSInteger _weight;
}
- (Person *)init;
- (Person*)initName:(NSString*)name andAge:(NSInteger)age;

- (void)setNames:(NSString*)name;
- (void)setAge:(NSInteger)age;

- (NSString*)name1;
- (NSInteger)age;

//get Set 方法麻烦吧,使用关键字 @property 就相当于 写了这两个 成员变量的set、get方法
//而这两个 address weight 就相当于 set get、的方法名
@property NSString *address;
@property NSInteger weight;

//@property不仅展开了 set get方法的声名
//而且 默认 完成了 @sythesize 语句，也就是完成了 set get方法的实现
// 那么 @sythesize 还有什么用
// 如果在 *.h 文件中不定义 成员变量的话
// 使用 @property 关键字 就会自动生成 set get方法的声名
// 并且 编译器会自动在 对应的 *.m文件中生成 对应的 @sythesize 关键字。
// 而@sythesize 关键字又自动在 *.m文件中生成了 私有的成员变量
// 这个也是定义 私有成员变量的关键

@property NSString * livePlace;
@property NSInteger height;

@end

