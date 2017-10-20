## Object-c 类 

```
 #import <Foundation/Foundation.h>
/*
 * @interface 定义一个类的关键字
 * @end 定义一个类结束
 * Student ：类名
 * NSObject OC 的基类
 * 系统类的命名
 * NSString NSObject NSArray
 * NS + String
 * NS : Next Step 公司名称
 */

@interface Student : NSObject
{
    //实例变量的定义
    /*
     * 命名规则：_开头，驼峰命名
     */
    NSString *_name;//NSString 是OC系统中提供的字符串类
    NSInteger _age;  //==>long
}

/*
 * 构造方法
 * id 一种数据类型 类似于c中的 void *
 * - 说明是 一个对象方法（实例方法）：给对象、实例调用的方法
 * 返回值： 是泛型类型的对象 
 * 方法名称 ： init
 * 无出入参数
 */
- (id)init;

/*
 * set方法
 *  方法名：setName:
 *  - 实例方法
 */
- (void)setName:(NSString *)name;
- (void)setAge:(NSInteger)age;


- (void)setName:(NSString *)name andAge:(NSInteger)age;
// 匿名方法
- (void)setName:(NSString *)name :(NSInteger)age;
/*
 * get方法
 */
- (NSString *)name;
- (NSInteger)age;

//类方法：
+ (void)testStudent;

@end

// 定义的类的实现 感觉这样 好麻烦（与java比较起来），这种定义方式 有点像
// Java中的 接口的定义方式
@implementation Student

- (id)init
{
    // self 表示调用者，指向调用者的对象指针变量
    // super 是调用父类方法的关键字
    self = [super init];
    if(self){//如果父类初始化成功的话
        // @"笑话" 表示Object-C中的一个字符串对象，Object-c中的字符串都要这么表示
        // ”笑话“ 表示 c 语言中的一个字符串。
        _name = @"笑话";
        _age = 12;
    }
    return self;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)setAge:(NSInteger)age
{
    _age = age;
}

-(void)setName:(NSString *)name andAge:(NSInteger)age
{
    _name = name;
    _age = age;
}
-(void)setName:(NSString *)name :(NSInteger)age
{
    _name= name;
    _age = age;
}

// 读取实例变量的值。
- (NSString *)name
{
    return _name;
}

- (NSInteger)age
{
    return _age;
}

// +开头的方法 类方法 类名直接调用
+ (void)testStudent
{
    Student *stu = [[Student alloc] init ];
    [stu setName:@"小飞" andAge:25];
    NSLog(@"name = %@,age = %li",[stu name],[stu age]);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Student alloc 创建Student 对象
        // [[Student alloc] init] 调用这个对象的 init方法
        Student *stu = [[Student alloc] init];
        // [stu name] [stu age] 表示调用方法
        // %@：打印对象的占位符
        // %li：打印long类型
        NSLog(@"name = %@,age = %li",[stu name] ,[stu age]);
        
        [stu setName:@"小明"];
        [stu setAge:20];
        [stu setName:@"小明" andAge:20];
        NSLog(@"name = %@,age = %li",[stu name] ,[stu age]);
        
        //类方法的直接调用方式
        [Student testStudent];
        
    }
    return 0;
}

```

