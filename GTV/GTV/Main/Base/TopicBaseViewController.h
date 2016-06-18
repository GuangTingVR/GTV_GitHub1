//
//  TopicBaseViewController.h
//  GTV
//
//  Created by 梁艳广 on 16/5/31.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicBaseViewController : UIViewController
/**
 *  列表
 */
@property (nonatomic,strong) UITableView * tableView;
/**
 *  数据源
 */
@property (nonatomic,strong) NSMutableArray * dataArr;
@property (nonatomic,strong) NSMutableDictionary *dicMutable;
/**
 *  网址
 */
@property (nonatomic,copy) NSString * url;
/**
 *  页数
 */
@property (nonatomic,assign) int page;
@property (nonatomic,strong) NSString *keywords;
/**
 *  设置网址
 */
- (void)setMyUrl:(NSString *)keyword;
/**
 *  请求数据
 */
- (void)loadData;
@end
