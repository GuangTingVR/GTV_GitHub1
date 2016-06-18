//
//  HttpRequest.m
//  LOLBox
//
//  Created by 刘硕 on 16/5/16.
//  Copyright © 2016年 刘硕. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

+ (void)startRequestWithUrl:(NSString*)url AndParmeter:(NSDictionary*)parmeter AndReturnBlock:(void(^)(NSData *data,NSError *error))block{
    //请求队列管理者
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //设置返回数据类型 NSData
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //get请求
    [manager GET:url parameters:parmeter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        block(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败
        block(nil,error);
    }];
    

}

@end
