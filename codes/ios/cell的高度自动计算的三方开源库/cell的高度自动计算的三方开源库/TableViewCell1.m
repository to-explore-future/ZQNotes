//
//  TableViewCell1.m
//  cell的高度自动计算的三方开源库
//
//  Created by 869518570@qq.com on 17/12/23.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "TableViewCell1.h"
#import "Masonry.h"

@interface TableViewCell1 ()

@property(nonatomic,strong)UIView * bg;

@end

@implementation TableViewCell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initFrame];
    }
    return self;
}

-(void)initFrame{
    [self.contentView addSubview:self.bg];
    [self.bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(200);
    }];
}


-(UIView *)bg{
    if (_bg == nil) {
        _bg = [[UIView alloc]init];
        [_bg setBackgroundColor:[UIColor greenColor]];
        [_bg setFrame:CGRectMake(0, 0, 200, 200)];
    }
    return _bg;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
