//
//  TopicModel.h
//  GTV
//
//  Created by 梁艳广 on 16/5/31.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PROPERTY(key) @property(nonatomic,copy)NSString *key
@interface TopicModel : NSObject

//展示(图片,标题,时间,时长)
PROPERTY(img);
PROPERTY(title);
PROPERTY(mamAirTime);
//播放
PROPERTY(url);
//详情
PROPERTY(mamPosterUrl);
PROPERTY(desc);



/*
 img : "http://yweb1.cnliveimg.com/img/CMCC_MOVIE/617374529_699022_HSJ1080V.jpg"
 docID : "599993"
 mediaId : "CMCC_00000000000000001_617374529"
 title : "求爱大作战（宋文佳版）"
 type : "program"
 url : "http://phone.movie.cnlive.com/jingcaituijian/detail_2016_04/01/599993.html"
 duration : "01:12:18"
 mamPosterUrl : "http://yweb1.cnliveimg.com/img/CMCC_MOVIE/617374529_336_220.jpg"
 subTitle : "求爱大作战（宋文佳版）"
 movieForm : "1"
 mamAirTime : "2016"
 vipFlag : "0"
 desc : "徐大宝，一个刚被有了新欢的女友抛弃的屌丝，痛定思痛的徐大宝决定用贴小广告征婚的方式来追求自己的爱情。苏媚，一个新时代性格独立的白领，要身材有身材要颜值有颜值，却屡屡相亲不顺，两人初识因误会给彼此留下不好的印象，而这次的相亲对象竟然是苏媚，两人由此引发了一系列精彩爆笑的恋情。"
 */
@end
