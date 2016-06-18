//
//  MovieDetailTableViewCell.h
//  GTV
//
//  Created by 梁艳广 on 16/6/2.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModel.h"
@interface MovieDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *albumImgView;
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

- (void)loadDataFromModel:(MovieDetailModel *)model;

@end
/*
 PROPERTY(albumImg); //图片
 PROPERTY(nm);       //中文标题
 PROPERTY(enm);      //英文标题
 PROPERTY(cat);      //电影类型
 PROPERTY(src);      //出自国家
 PROPARTY(dur);      //电影时长
 PROPERTY(pubDesc);  //上映时间
 
 PROPERTY(dir);      //导演
 PROPERTY(star);     //主演
 PROPERTY(dra);      //详情
 */