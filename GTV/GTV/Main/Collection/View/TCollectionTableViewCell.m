//
//  TCollectionTableViewCell.m
//  GTV
//
//  Created by 梁艳广 on 16/6/5.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "TCollectionTableViewCell.h"

@implementation TCollectionTableViewCell

- (void)loadDataFromModel:(CollectionModel *)model{
    _nmLabel.text = model.Moivenm;
    _descLabel.text = model.Moivedesc;


}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
