//  SyncGET
//
//  Created by Sure on 14-10-7.
//  Copyright (c) 2014年 Sure. All rights reserved.
//

#import <Foundation/Foundation.h>
//常用字符串加密库
//用于对网址加密解密操作
@interface NSString (URLEncoding)
//加密操作
-(NSString *)URLEncodedString;
//解密操作
-(NSString *)URLDecodedString;
//品牌详情列表图片
- (NSString *)URLDecodedPicString;
//视频图片
- (NSString *)URLDecodedVideoPicString;

//在指定两个字符串之间替换字符串
- (NSString *)URLDecodedStringWithStarStr:(NSString *)starStr andEndStr:(NSString *)endStr andReplaceStr:(NSString *)replaceStr;
//删除字符串中指定的字符
- (NSString *)deleteString:(NSString *)deleteStr;


@end
