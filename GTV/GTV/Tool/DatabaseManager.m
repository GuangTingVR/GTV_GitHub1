//
//  DatabaseManager.m
//  StudentDatabase
//
//  Created by Elean on 16/5/4.
//  Copyright © 2016年 Elean. All rights reserved.
//

#import "DatabaseManager.h"
#import "CollectionModel.h"

@interface DatabaseManager()

@property (nonatomic,strong)FMDatabase *database;
//声明一个私有属性 database 代表数据库

@end


@implementation DatabaseManager

#pragma mark -- 单例方法

+ (DatabaseManager *)sharedManager{
    
    static DatabaseManager *manager = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[DatabaseManager alloc]init];
        
      //manager初始化时 应该创建数据库以及表格 为接下来数据的增删改查做好准备
        
        //创建数据库
       [manager createDatabase];
        
        //创建表格
        [manager createTable];
        
        
    });
    
    return manager;
    
}

#pragma mark -- 创建数据库
- (void)createDatabase{

//    1.数据库路径
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents/collection.db", NSHomeDirectory()];
    
//    2.创建数据库
    _database = [[FMDatabase alloc]initWithPath:path];
    
//    3.打开数据库
    [_database open];
    
    NSLog(@"path:%@", path);
    
}

#pragma mark -- 创建表格
- (void)createTable{
//图片
//影片名字
//    1.SQL语句
    
    NSString *sql = @"create table if not exists collectiontable(moviedesc text,Movienm text)";
    
//    2.调用方法执行SQL语句
    BOOL isSuccess = [_database executeUpdate:sql];
    
    if (isSuccess) {
        
        NSLog(@"创建表格成功！");
        
    }else{
    
        NSLog(@"创建表格失败！");
    }
    
    
    

}

#pragma mark -- 增
- (void)insertDataWithModel:(MovieModel *)model{
    
        NSString *sql = @"insert into collectiontable values(?,?)";
    
        BOOL isSuc = [_database executeUpdate:sql, model.desc,model.nm];
    NSLog(@"%@",model.desc);
    
    if(isSuc){
        NSLog(@"插入成功");
    }else{
        NSLog(@"插入失败");
    
    }

}


#pragma mark -- 删
- (void)deleteDataWithArray1:(MovieModel *)model{
    
    //    1.SQL语句
    NSString *sql = @"delete from collectiontable where moviedesc=? and Movienm=?";
    
    //    2.调用方法 删除数据
    
    [_database executeUpdate:sql,model.desc,model.nm];
    
}


#pragma mark -- 删
- (void)deleteDataWithArray:(CollectionModel *)model{

//    1.SQL语句
    NSString *sql = @"delete from collectiontable where moviedesc=? and Movienm=?";
    
//    2.调用方法 删除数据
    
        [_database executeUpdate:sql,model.Moivedesc,model.Moivenm];
    
}

#pragma mark -- 改


#pragma mark -- 查
//查询所有
- (NSArray *)selectAllDatas{

//    1.创建一个可变数据 用于模型的装载 然后返回
    NSMutableArray *dataArr = [NSMutableArray array];
    
//    2.SQL语句
    
    NSString *sql = @"select * from collectiontable";
    
//    3.调用方法 查询数据
    FMResultSet *resultSet = [_database executeQuery:sql];
    
    
//    4.遍历数据 封装模型
    while ([resultSet next]) {
        
        CollectionModel * model = [[CollectionModel alloc] init];
        
        model.Moivedesc = [resultSet stringForColumn:@"moviedesc"];
        
        NSLog(@"%@",model.Moivedesc);
        model.Moivenm = [resultSet stringForColumn:@"Movienm"];

        NSLog(@"%@",model.Moivenm);

        //[dataArr addObject:[MovieModel createModelWithDic:dic]];
        
        [dataArr addObject:model];
        
    }
  
    return dataArr;

}






- (void)dealloc
{
    
    [_database close];
//    关闭数据库
    
//    ARC下可以重写析构方法 但是不能写[super dealloc];
    
}


@end










