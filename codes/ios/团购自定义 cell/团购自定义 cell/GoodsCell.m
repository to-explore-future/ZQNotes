//
//  GoodsCell.m
//  团购自定义 cell
//
//  Created by to-explore-future on 17/11/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "GoodsCell.h"

@interface GoodsCell ()

@property (weak, nonatomic) IBOutlet UIImageView    * icon;
@property (weak, nonatomic) IBOutlet UILabel        * title;
@property (weak, nonatomic) IBOutlet UILabel        * price;
@property (weak, nonatomic) IBOutlet UILabel        * buyCount;


@end

@implementation GoodsCell

//
+(instancetype)goodsCellWithTableView:(UITableView *)tableView{
    NSString * ID = @"cell_ID";
    GoodsCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GoodsCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

-(void)setGood:(GoodsModel *)good{
   
    //这里坑死人 _good 和 self.good 的区别还是很大的
    _good               = good;
    self.icon.image     = [UIImage imageNamed:good.icon];
    self.price.text     = [NSString stringWithFormat:@"$ %@",good.price];
    self.buyCount.text  = [NSString stringWithFormat:@"已经有%@人购买",good.buyCount];
    self.title.text     = good.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
