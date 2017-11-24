//
//  CellModel.h
//  大洲分类
//
//  Created by to-explore-future on 17/11/22.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property(nonatomic,strong)NSString         * series;
@property(nonatomic,strong)NSMutableArray   * countries;
@property(nonatomic,strong)NSString         * continentDescription;

-(instancetype)initWithDic:(NSDictionary *)dic;

+(instancetype)goupWithDic:(NSDictionary *)dic;



@end
