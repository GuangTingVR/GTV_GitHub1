//
//  MovieTableViewCell.m
//  GTV
//
//  Created by 梁艳广 on 16/6/1.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MovieTableViewCell.h"
#import "DatabaseManager.h"

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

@implementation MovieTableViewCell

- (void)awakeFromNib {

}





- (void)loadDataFromModel:(MovieModel *)model{
    _nmLabel.text = model.nm;
    _scmLabel.text = model.scm;
    _descLabel.text = model.desc;
    _mkLabel.text = [NSString stringWithFormat:@"%.1f",model.mk];
    //_mkLabel.text = [NSString stringWithFormat:@"%@",model.mk];
    
    //http://p0.meituan.net/w.h/movie/3fb88bd1248e1aa85712047aa34ab1d0587282.jpg
    //需要把 /w.h 去掉
    NSString *str = [model.img URLDecodedStringWithStarStr:@"/w" andEndStr:@"h/" andReplaceStr:@"/"];
    [_imgView setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@""]];
    
    [_collectss setTitle:@"收藏" forState:UIControlStateNormal];
    [_collectss setTitle:@"已收藏" forState:UIControlStateSelected];

    if (model.isSelected) {
        _collectss.selected = YES;
    }else {
        _collectss.selected = NO;
    }
    

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
