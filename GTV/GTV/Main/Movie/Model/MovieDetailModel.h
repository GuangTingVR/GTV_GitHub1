//
//  MovieDetailModel.h
//  GTV
//
//  Created by 梁艳广 on 16/6/1.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PROPERTY(key) @property(nonatomic,copy)NSString *key
#define PROPARTY(kay) @property (nonatomic,strong) NSNumber *kay
@interface MovieDetailModel : NSObject

PROPERTY(albumImg); //图片
PROPERTY(nm);       //中文标题
PROPERTY(enm);      //英文标题
PROPERTY(cat);      //电影类型
PROPERTY(src);      //出自国家
PROPARTY(dur);      //电影时长
PROPERTY(pubDesc);  //上映时间
PROPARTY(wish);     //想看人数

PROPERTY(dir);      //导演
PROPERTY(star);     //主演
PROPERTY(dra);      //详情

PROPERTY(videourl); //预告片 MP4
@end
/*
 albumImg : "http://p1.meituan.net/movie/6318e7ca7ff66e94ba3d01a7b838475437425.jpg"
 awardUrl : ""
 cat : "动作,战争,奇幻"
 commented : false
 dir : "邓肯·琼斯"
 dra : "兽人部落即将消亡，为了生存，他们开始与人类王国作战。然而，无论联盟还是部落，他们面临的威胁远不止彼此。为了对抗即将到来的黑暗势力，人类联盟的安杜因（崔维斯·费米尔 饰）与兽人部落的杜隆坦（托比·凯贝尔 饰）决定联手，昔日的仇敌，为了各自的存亡，为了整个艾泽拉斯大陆，终于开始并肩作战。"
 dur : 124
 enm : "Warcraft"
 fra : "美国,韩国"
 frt : "2016-06-10,2016-06-09"
 globalReleased : false
 id : 78421
 img : "http://p0.meituan.net/w.h/movie/f94e67dcd5b48f034bd7adc892f1b20695854.jpeg"
 musicName : "We Will Rule 背水一战（推广曲）"
 musicNum : 20
 nm : "魔兽"
 onSale : true
 onlinePlay : false
 photos
 pn : 304
 proCompany : "Atlas Entertainment,美国传奇影业,暴雪娱乐公司,美国环球影片公司,腾讯影业"
 pubDesc : "2016-06-08大陆上映"
 relCompany : "美国环球影片公司"
 rt : "2016-06-08"
 sc : 0
 scm : "怒拳为谁握，联盟斗部落"
 showst : 4
 snum : 19663
 src : "美国"
 star : "崔维斯·费米尔,宝拉·巴顿,本·福斯特"
 vd : "http://v.meituan.net/movie/videos/f2bd8b34af584ea7939b8b4a286e3f0f.mp4"
 ver : "2D/3D/IMAX 3D/中国巨幕/全景声"
 videoImg : "http://p0.meituan.net/movie/2479bda90bfbed070c6623e4884069dc61292.jpg"
 videoName : "吴彦祖角色预告片"
 videourl : "http://v.meituan.net/movie/videos/f2bd8b34af584ea7939b8b4a286e3f0f.mp4"
 vnum : 58
 wish : 427488
 wishst : 0
*/