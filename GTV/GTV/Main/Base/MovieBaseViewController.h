//
//  MovieBaseViewController.h
//  GTV
//
//  Created by 梁艳广 on 16/5/30.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieBaseViewController : UIViewController

@property (nonatomic,strong) NSMutableArray *dataIsok;

//列表
@property(nonatomic,strong) UITableView *tableView;
//数据源
@property(nonatomic,strong) NSMutableArray *dataArr;
//网址
@property(nonatomic,copy) NSString *url;
//传输
//@property(nonatomic,copy) NSString *URL;
//页数控制
//@property(nonatomic,assign) int page;
//设置网址
- (void)setMyurl;
//请求数据
- (void)loadData;

@end
