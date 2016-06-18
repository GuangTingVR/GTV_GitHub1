//
//  MovieModel.h
//  GTV
//
//  Created by 梁艳广 on 16/6/1.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <Foundation/Foundation.h>


#define PROPERTY(key) @property(nonatomic,copy)NSString *key
#define PROPARTY(kay) @property (nonatomic,strong) NSNumber *kay
@interface MovieModel : NSObject
//字符串
PROPERTY(img);  //图片
PROPERTY(nm);   //影片名字
PROPERTY(scm);  //"怒拳为谁握，联盟斗部落"
PROPERTY(desc); //上映时间
//对象
PROPARTY(wish); //多少人想看
PROPARTY(ID);
@property (nonatomic,assign) float mk;
//PROPARTY(mk); //评分


//收藏
@property (nonatomic, assign) BOOL isSelected;



PROPERTY(cat);  //影片类型
PROPERTY(dir);  //导演
PROPERTY(star); //参演明星
PROPERTY(videourl); // 预告片



+ (MovieModel *)createModelWithDic:(NSDictionary *)dic;


@end
/*
 cat : "动作,战争,奇幻"
 civilPubSt : 0
 desc : "2016-06-08 下周三上映"
 dir : "邓肯·琼斯"
 dur : 124
 effectShowNum : 0
 fra : "美国,韩国"
 frt : "2016-06-10,2016-06-09"
 globalReleased : false
 id : 78421
 img : "http://p0.meituan.net/w.h/movie/f94e67dcd5b48f034bd7adc892f1b20695854.jpeg"
 late : false
 localPubSt : 0
 mk : 9.8
 nm : "魔兽"
 pn : 289
 preSale : 1
 preShow : false
 pubDate : 1465315200000
 pubShowNum : 0
 recentShowDate : 0
 recentShowNum : 0
 rt : "2016-06-08"
 sc : 9.8
 scm : "怒拳为谁握，联盟斗部落"
 showNum : 0
 showst : 0
 snum : 19352
 star : "崔维斯·费米尔,宝拉·巴顿,本·福斯特"
 ver : "2D/3D/IMAX 3D/中国巨幕/全景声"
 videoId : 45926
 videoName : "吴彦祖角色预告片"
 videourl : "http://v.meituan.net/movie/videos/f2bd8b34af584ea7939b8b4a286e3f0f.mp4"
 vnum : 58
 weight : 1
 wish : 423940
 wishst : 0
 */