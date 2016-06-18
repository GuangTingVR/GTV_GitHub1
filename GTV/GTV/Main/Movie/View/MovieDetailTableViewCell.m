//
//  MovieDetailTableViewCell.m
//  GTV
//
//  Created by 梁艳广 on 16/6/2.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MovieDetailTableViewCell.h"
/*
 @property (weak, nonatomic) IBOutlet UILabel *nmLabel;
 @property (weak, nonatomic) IBOutlet UILabel *enmLabel;
 @property (weak, nonatomic) IBOutlet UILabel *catLabel;
 @property (weak, nonatomic) IBOutlet UILabel *srcLabel;
 @property (weak, nonatomic) IBOutlet UILabel *durLabel;
 @property (weak, nonatomic) IBOutlet UILabel *pubDescLabel;
 @property (weak, nonatomic) IBOutlet UILabel *wishLabel;
 
 
 @property (weak, nonatomic) IBOutlet UILabel *dirLabel;
 @property (weak, nonatomic) IBOutlet UILabel *starLabel;
 @property (weak, nonatomic) IBOutlet UITextView *draTextView;
 */
@implementation MovieDetailTableViewCell


- (void)loadDataFromModel:(MovieDetailModel *)model{
    
    [_albumImgView setImageWithURL:[NSURL URLWithString:model.albumImg] placeholderImage:[UIImage imageNamed:@""]];
    _nmLabel.text = model.nm;
    _enmLabel.text = model.enm;
    _catLabel.text = model.cat;
    _srcLabel.text = model.src;
    _durLabel.text = [NSString stringWithFormat:@"%@",model.dur];
    _pubDescLabel.text = model.pubDesc;
    _wishLabel.text = [NSString stringWithFormat:@"%@",model.wish];
    
    _dirLabel.text = model.dir;
    _starLabel.text = model.star;
    _draTextView.text = model.dra;

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
