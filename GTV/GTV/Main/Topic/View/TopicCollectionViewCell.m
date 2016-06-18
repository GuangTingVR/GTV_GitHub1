//
//  TopicCollectionViewCell.m
//  GTV
//
//  Created by 梁艳广 on 16/6/1.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "TopicCollectionViewCell.h"

@implementation TopicCollectionViewCell



- (void)loadDataFromModel:(TopicModel *)model{
    _titleLabel.text = model.title;
    
    _descTextView.text = model.desc;
    _descTextView.editable = NO;
    _descTextView.hidden = YES;
    _mamAirTimeLabel.text = model.mamAirTime;
    [_ImgView setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@""]];
    
}
- (IBAction)descClicked:(UIButton *)sender {

    sender.selected = !sender.selected;
    
    if (sender.selected) {
        _descTextView.hidden = NO;
    }else{
        _descTextView.hidden = YES;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

@end
