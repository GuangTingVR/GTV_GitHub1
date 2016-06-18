//
//  MovieModel.m
//  GTV
//
//  Created by 梁艳广 on 16/6/1.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isSelected = NO;
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }

}


+ (MovieModel *)createModelWithDic:(NSDictionary *)dic{
    MovieModel *model = [[MovieModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

@end
