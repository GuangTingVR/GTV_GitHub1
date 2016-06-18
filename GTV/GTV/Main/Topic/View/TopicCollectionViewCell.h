//
//  TopicCollectionViewCell.h
//  GTV
//
//  Created by 梁艳广 on 16/6/1.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

@interface TopicCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *mamAirTimeLabel;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;

- (void)loadDataFromModel:(TopicModel *)model;
@end
/*
 //展示(图片,标题,时间,时长)
 PROPERTY(img);
 PROPERTY(title);
 PROPERTY(mamAirTime);
 //播放
 PROPERTY(url);
 //详情
 PROPERTY(mamPosterUrl);
 PROPERTY(desc);
 */