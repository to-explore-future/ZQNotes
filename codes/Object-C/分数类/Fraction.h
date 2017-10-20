//
//  Fraction.h
//  分数类
//
//  Created by to-explore-future on 17/10/16.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
    NSInteger _numerator;
    NSInteger _denominator;
}

//构造
- (id)initWithNomerator:(NSInteger)nomerator andDenominator:(NSInteger)denominator;

//set
- (void)setNumerator:(NSInteger)numerator andDenominator:(NSInteger)denominator;

//get
- (NSInteger)numerator;
- (NSInteger)denominator;

//加减乘除
- (void)add:(Fraction *)aFraction;
- (void)substract:(Fraction *)aFraction;
- (void)multiplication:(Fraction *)aFraction;
- (void)divison:(Fraction *)aFraction;

//约分 辗转相除法
- (void)reduce;

//打印
- (void)print;
@end
