//
//  ApiHeader.h
//  GTV
//
//  Created by 梁艳广 on 16/5/29.
//  Copyright © 2016年 guangting. All rights reserved.
//

#ifndef ApiHeader_h
#define ApiHeader_h

////////////////////////////////电影///////////////////////////////
//正在热映
#define URL_MOVIE @"http://api.maoyan.com/mmdb/movie/v1/list/hot.json?&ct=上海"
#define URL_MOVIEDETAIL @"http://api.maoyan.com/mmdb/movie/v5/%@.json"
//正在上映
#define URL_MOVIETOP @"http://api.maoyan.com/mmdb/movie/v1/list/coming.json?ct=上海"


////////////////////////////////V影///////////////////////////////

//热门11
#define URL_HOT @"http://app.vmoiver.com/apiv3/post/getPostByTab?p=%d&tab=hot"
//创意
#define URL_IDEARS @"http://app.vmoiver.com/apiv3/post/getPostInCate?cateid=6&p=%d"
//搞笑
#define URL_FUNNY @"http://app.vmoiver.com/apiv3/post/getPostInCate?cateid=8&p=%d"
//音乐
#define URL_MUSIC @"http://app.vmoiver.com/apiv3/post/getPostInCate?cateid=18&p=%d"
//旅行
#define URL_TRIP @"http://app.vmoiver.com/apiv3/post/getPostInCate?cateid=11&p=%d"
//生活11
#define URL_LIFE @"http://app.vmoiver.com/apiv3/post/getPostInCate?cateid=78&p=%d"
//科幻
#define URL_SF  @"http://app.vmoiver.com/apiv3/post/getPostInCate?cateid=23&p=%d"
//萌仔
#define URL_ANIMATION @"http://app.vmoiver.com/apiv3/post/getPostInCate?cateid=16&p=%d"

//播放视频
#define URL_FUNNYVIDEO @"http://app.vmoiver.com/apiv3/post/view?postid=%@"



////////////////////////////////专题///////////////////////////////

//专题
#define URL_TOPIC @"http://so.cnlive.com/so/search?functionId=programlist"
#define PARAMS @{@"keyword":@"喜剧",@"appid":@"movie",@"plat":@"i",@"pageSize":@"15",@"version":@"5.0",@"page":@"1"}

/*
 
 手机电影:
 //原始(UrlEncode编码)
 http://so.cnlive.com/so/search?functionId=programlist&params=%7B%22keyword%22%3A%22%E5%96%9C%E5%89%A7%22%2C%22appid%22%3A%22movie%22%2C%22plat%22%3A%22i%22%2C%22pageSize%22%3A%2215%22%2C%22version%22%3A%225.0%22%2C%22page%22%3A%221%22%7D
 
 (UrlDecode解码)
http://so.cnlive.com/so/search?functionId=programlist&params={"keyword":"喜剧","appid":"movie","plat":"i","pageSize":"15","version":"5.0","page":"1"}
 
 NSDictionary *dicParams = PARAMS;
 _dicMutable = [NSMutableDictionary dictionaryWithDictionary:dicParams];  //_dicMutable可变字典
 
 [_dicMutable setObject:_keywords forKey:@"keyword"];
 [_dicMutable setObject:[NSString stringWithFormat:@"%d",_page] forKey:@"page"];
 
 NSData *data = [NSJSONSerialization dataWithJSONObject:_dicMutable options:NSJSONWritingPrettyPrinted error:nil];
 
 NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
 
 NSDictionary *dictcount = @{@"params":str};
 
 [HttpRequest startRequestWithUrl:URL_TOPIC AndParmeter:dictcount AndReturnBlock:^(NSData *data, NSError *error) {
 if (!error) {

 }
 
 }else{
 
 }];
 
 
 */

#endif /* ApiHeader_h */
