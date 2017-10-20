//
//  Fraction.m
//  分数类
//
//  Created by to-explore-future on 17/10/16.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

- (id)initWithNomerator:(NSInteger)numerator andDenominator:(NSInteger)denominator{
    if(self = [super init]){
        _numerator = numerator;
        _denominator = denominator;
    }
    return self;
}

- (void)setNumerator:(NSInteger)numerator andDenominator:(NSInteger)denominator{
    _numerator = numerator;
    _denominator = denominator;
}

-(NSInteger)numerator{
    return _numerator;
}
-(NSInteger)denominator{
    return _denominator;
}
// (1/3) * (2/5) = (1*5 + 2*3)/3*5
- (void)add:(Fraction *)aFraction{
    _numerator =  [self numerator]*[aFraction denominator] + [self denominator]*[aFraction numerator];
    _denominator = [self denominator]*[aFraction denominator];
}

- (void)substract:(Fraction *)aFraction{
    _numerator =  [self numerator]*[aFraction denominator] - [self denominator]*[aFraction numerator];
    _denominator = [self denominator]*[aFraction denominator];
}

- (void)multiplication:(Fraction *)aFraction{
    _numerator =  [self numerator]*[aFraction numerator];
    _denominator = [self denominator]*[aFraction denominator];
}

- (void)divison:(Fraction *)aFraction{
    _numerator =  [self numerator]*[aFraction denominator] ;
    _denominator = [self denominator]*[aFraction numerator];
    }


- (void)reduce{
    NSInteger divisor = [self numerator];
    NSInteger dividend = [self denominator];
        //所有的余数都给了 divident
    while (dividend) {
        NSInteger mob = divisor % dividend;
        divisor = dividend;
        dividend = mob;
    }
    _numerator /= divisor;
    _denominator /= divisor;
}

- (void)print{
    [self reduce];
    NSLog(@"\n%li/%li \n",_numerator,_denominator) ;
}

@end
