//
//  MovieTableViewCell.h
//  GTV
//
//  Created by 梁艳广 on 16/6/1.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "isOKModel.h"
@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nmLabel;
@property (weak, nonatomic) IBOutlet UILabel *scmLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *mkLabel;

@property (weak, nonatomic) IBOutlet UIButton *collectss;


- (void)loadDataFromModel:(MovieModel *)model;

@end
/*
 //字符串
 PROPERTY(img);  //图片
 PROPERTY(nm);   //影片名字
 PROPERTY(scm);  //"怒拳为谁握，联盟斗部落"
 PROPERTY(desc); //上映时间
 //对象
 PROPARTY(wish); //多少人想看
 PROPARTY(ID);
 PROPARTY(mk); //评分
 */