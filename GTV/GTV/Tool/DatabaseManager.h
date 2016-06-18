//
//  DatabaseManager.h
//  StudentDatabase
//
//  Created by Elean on 16/5/4.
//  Copyright © 2016年 Elean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieModel.h"
#import "CollectionModel.h"

@interface DatabaseManager : NSObject

//单例方法 
+ (DatabaseManager *)sharedManager;

- (void)insertDataWithModel:(MovieModel *)model;

- (void)deleteDataWithArray:(CollectionModel *)model;
//增
//- (void)insertDatasWithArray:(NSArray *)modelArr;

//删
- (void)deleteDataWithArray1:(MovieModel *)model;
//- (void)deleteDataWithArray:(NSArray *)modelArr;

//改

//查
//查询所有
- (NSArray *)selectAllDatas;





@end








