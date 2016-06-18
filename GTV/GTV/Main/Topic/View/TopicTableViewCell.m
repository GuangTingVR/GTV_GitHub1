//
//  TopicTableViewCell.m
//  GTV
//
//  Created by 梁艳广 on 16/5/31.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "TopicTableViewCell.h"


@implementation TopicTableViewCell



- (void)loadDataFromModel:(TopicModel *)model{
    _titleLabel.text = model.title;
    _descLabel.text = model.desc;
    _descLabel.editable = NO;
    _manAirTimeLabel.text = model.mamAirTime;
    [_ImgView setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@""]];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
