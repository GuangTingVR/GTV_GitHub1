//
//  FunnyModel.h
//  GTV
//
//  Created by 梁艳广 on 16/6/4.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PROPERTY(key) @property(nonatomic,copy)NSString *key
@interface FunnyModel : NSObject

PROPERTY(image);
PROPERTY(title);
PROPERTY(postid);

@end
/*
 postid : "49084"
 title : "亚裔男生模仿Kpop组合爆笑短片《屎尿屁之歌》"
 pid : "1"
 app_fu_title : ""
 is_xpc : "0"
 is_promote : "0"
 is_xpc_zp : "0"
 is_xpc_cp : "0"
 is_xpc_fx : "0"
 is_album : "0"
 tags : ""
 recent_hot : "0"
 discussion : "0"
 image : "http://cs.vmoiver.com/Uploads/cover/2016-05-18/573c4edfa6a25_cut.jpeg"
 rating : "7.6"
 duration : "363"
 publish_time : "1463616180"
 like_num : "1056"
 share_num : "2231"
 cates
 0
 cateid : "8"
 catename : "搞笑"
 request_url : "http://app.vmoiver.com/49084?qingapp=app_new"
 */