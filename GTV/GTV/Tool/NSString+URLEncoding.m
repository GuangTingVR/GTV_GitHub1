//  SyncGET
//
//  Created by Sure on 14-10-7.
//  Copyright (c) 2014年 Sure. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)


- (NSString *)URLEncodedString{
    
    NSMutableString * resultStr = [NSMutableString stringWithString:self];
    
    return resultStr;
}


- (NSString*)URLDecodedStringWithStarStr:(NSString *)starStr andEndStr:(NSString *)endStr andReplaceStr:(NSString *)replaceStr{
    
    NSMutableString * resultStr = [NSMutableString stringWithString:self];
    
    NSRange starRange = [resultStr rangeOfString:starStr];
    NSRange endRange = [resultStr rangeOfString:endStr];
    
    if (starRange.location != NSNotFound && endRange.location != NSNotFound) {
        
        int star = (int)starRange.location;
        int end = (int)endRange.location+(int)endRange.length-(int)starRange.location;
        NSRange range = {star, end};
        
        [resultStr replaceCharactersInRange:range withString:replaceStr];
        
    }
    
    return resultStr;
}


- (NSString*)URLDecodedString{
    
    NSMutableString * resultStr = [NSMutableString stringWithString:self];
    
    NSString * replaceStr = @"270-180";
    NSString * starStr = @"{0}";
    NSString * endStr = @"{1}";
    
    NSRange starRange = [resultStr rangeOfString:starStr];
    NSRange endRange = [resultStr rangeOfString:endStr];
    
    if (starRange.location != NSNotFound && endRange.location != NSNotFound) {
        
        int star = (int)starRange.location;
        int end = (int)endRange.location+(int)endRange.length-(int)starRange.location;
        NSRange range = {star, end};
        
        [resultStr replaceCharactersInRange:range withString:replaceStr];
        
//        NSLog(@"%@",resultStr);
    }
    
    
    return resultStr;
    
}


- (NSString *)URLDecodedPicString{
    
    NSMutableString * resultStr = [NSMutableString stringWithString:self];
    
    NSString * replaceStr = @"2";
    NSString * starStr = @"{0";
    NSString * endStr = @"}";
    
    NSRange starRange = [resultStr rangeOfString:starStr];
    NSRange endRange = [resultStr rangeOfString:endStr];
    
    if (starRange.location != NSNotFound && endRange.location != NSNotFound) {
        
        int star = (int)starRange.location;
        int end = (int)endRange.location+(int)endRange.length-(int)starRange.location;
        NSRange range = {star, end};
        
        [resultStr replaceCharactersInRange:range withString:replaceStr];
        
//        NSLog(@"%@",resultStr);
    }
    
    return resultStr;

}

- (NSString *)URLDecodedVideoPicString{
    
    NSMutableString * resultStr = [NSMutableString stringWithString:self];
    
    NSString * replaceStr = @"270-180";
    NSString * starStr = @"{0}";
    NSString * endStr = @"{1}";
    
    NSRange starRange = [resultStr rangeOfString:starStr];
    NSRange endRange = [resultStr rangeOfString:endStr];
    
    if (starRange.location != NSNotFound && endRange.location != NSNotFound) {
        
        int star = (int)starRange.location;
        int end = (int)endRange.location+(int)endRange.length-(int)starRange.location;
        NSRange range = {star, end};
        
        [resultStr replaceCharactersInRange:range withString:replaceStr];
        
        //        NSLog(@"%@",resultStr);
    }
    
    
    return resultStr;

}


//删除字符串中指定的字符
- (NSString *)deleteString:(NSString *)deleteStr{
    NSMutableString * resultStr = [[NSMutableString alloc] init];
    
    NSArray * array = [self componentsSeparatedByString:deleteStr];
    
    for (int i = 0; i < array.count; i++) {
        
        NSString * string = array[i];
        
        [resultStr appendString:string];
    }
    
    return resultStr;
}



@end
