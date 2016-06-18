//
//  TopicTableViewCell.h
//  GTV
//
//  Created by 梁艳广 on 16/5/31.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

@interface TopicTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descLabel;

@property (weak, nonatomic) IBOutlet UILabel *manAirTimeLabel;

- (void)loadDataFromModel:(TopicModel *)model;
@end
