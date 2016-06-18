//
//  FunnyCollectionViewCell.m
//  GTV
//
//  Created by 梁艳广 on 16/6/4.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "FunnyCollectionViewCell.h"

@implementation FunnyCollectionViewCell

- (void)awakeFromNib {
    self.imageView.layer.borderWidth = 5;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 5;
    self.imageView.clipsToBounds = YES;}

- (void)loadDataFromModel:(FunnyModel *)model{
    _titleLabel.text = model.title;
    [_imageView setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@""]];
}



@end
