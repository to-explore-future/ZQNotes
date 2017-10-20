
/*
 * 搞一个分数类 实现加减乘除 实现约分
 * 1.先按照 教程的方法 实现 
 * 2.再按照事务本身的逻辑-->算法单独拿出来
 */

#import <Foundation/Foundation.h>
#import "Fraction.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *f1 = [[Fraction alloc] initWithNomerator:7 andDenominator:15];
        Fraction *f2 = [[Fraction alloc] initWithNomerator:2 andDenominator:5];
        [f1 add: f2];
        [f1 print];
    }
    return 0;
}
