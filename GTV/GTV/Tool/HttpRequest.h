//
//  HttpRequest.h
//  LOLBox
//
//  Created by 刘硕 on 16/5/16.
//  Copyright © 2016年 刘硕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject

+ (void)startRequestWithUrl:(NSString*)url AndParmeter:(NSDictionary*)parmeter AndReturnBlock:(void(^)(NSData *data,NSError *error))block;


@end









