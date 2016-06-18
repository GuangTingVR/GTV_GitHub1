//
//  TopicBaseViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/31.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "TopicBaseViewController.h"
#import "TopicTableViewCell.h"
#import "TopicModel.h"
#import "TopicDetailViewController.h"

@interface TopicBaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TopicBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self initData];
    //设置网址
    //_keywords = @"喜剧";
    [self setMyUrl:_keywords];
    //加载数据
    [self loadData];
    //创建列表
    [self createTabelView];
}


- (void)initData{
    _dataArr = [[NSMutableArray alloc]init];
    self.page = 1;
}

- (void)setMyUrl:(NSString *)keyword{
    NSDictionary *dicParams = PARAMS;
    _dicMutable = [NSMutableDictionary dictionaryWithDictionary:dicParams];
    [_dicMutable setObject:_keywords forKey:@"keyword"];
    [_dicMutable setObject:[NSString stringWithFormat:@"%d",_page] forKey:@"page"];
    
}

- (void)loadData{
    if (_page == 1) { //显示第一页的才加载
        //添加加载栏
        [MMProgressHUD showWithStatus:@"loading..."];
        //更改加载兰的样式
        [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];//黑色
    }
    
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:_dicMutable options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"===%@===",str);
    NSDictionary *dictcount = @{@"params":str};
    
    [HttpRequest startRequestWithUrl:URL_TOPIC AndParmeter:dictcount AndReturnBlock:^(NSData *data, NSError *error) {
        if (!error) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *resultArr = dict[@"programs"];
            for (NSDictionary *dic in resultArr) {
                
                //建立数据模型 存储数据
                TopicModel *model = [[TopicModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                //添加数据源
                [_dataArr addObject:model];
            }
            //属性tableview
            [_tableView reloadData];
            
            //去除下拉刷新空间动作
            [_tableView.header endRefreshing];
            //去除上拉加载空间动作
            [_tableView.footer endRefreshing];
            //去除加载兰
            [MMProgressHUD dismissWithSuccess:@"success"];
            
            
        }else{
            NSLog(@"%@",error.localizedDescription);
            //去除下拉刷新空间空间动作
            [_tableView.header endRefreshing];
            [_tableView.footer endRefreshing];
            //去除加载兰
            [MMProgressHUD dismissWithError:error.localizedDescription];
        }
        
    }];

}


- (void)createTabelView{
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-49-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    //xib方式
    [_tableView registerNib:[UINib nibWithNibName:@"TopicTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELLID"];
    
    //下拉刷新
    [self addDropDownRefresh];
    
    //上拉加载
    [self addDropUpRefresh];

}



#pragma mark --下拉刷新
- (void)addDropDownRefresh{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        //下拉刷新的操作
        //页数归1
        _page = 1;
        //清空数据源重新发生网络请求
        [_dataArr removeAllObjects];
        //重新设置一下网址
        [self setMyUrl:_keywords];
        //加载数据
        [self loadData];
        
    }];
    //设置刷新中的动画
    NSArray *imagesArr = @[[UIImage imageNamed:@"loading_1"],[UIImage imageNamed:@"loading_2"],[UIImage imageNamed:@"loading_3"],[UIImage imageNamed:@"loading_4"],[UIImage imageNamed:@"loading_5"],[UIImage imageNamed:@"loading_6"]];
    //正在刷新中的动画状态
    [header setImages:imagesArr forState:MJRefreshStateRefreshing];
    self.tableView.header  =  header;
}

#pragma mark --上拉加载
- (void)addDropUpRefresh{
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        //上拉加载
        _page++;
        //重新设置一下网址
        [self setMyUrl:_keywords];
        //请求数据
        [self loadData];
    }];
    //设置刷新中的动画
    NSArray *imagesArr = @[[UIImage imageNamed:@"loading_1"],[UIImage imageNamed:@"loading_2"],[UIImage imageNamed:@"loading_3"],[UIImage imageNamed:@"loading_4"],[UIImage imageNamed:@"loading_5"],[UIImage imageNamed:@"loading_6"]];
    //正在刷新中的动画状态
    [footer setImages:imagesArr forState:MJRefreshStateRefreshing];
    self.tableView.footer  =  footer;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark --datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID" forIndexPath:indexPath];
    if (indexPath.row < _dataArr.count) {
        TopicModel *model = _dataArr[indexPath.row];
        [cell loadDataFromModel:model];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160.0;
}


#pragma mark --cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //除去默认停留效果()
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //跳转详情页面
    TopicDetailViewController *detail = [[TopicDetailViewController alloc]init];
    
    //隐藏分栏
    detail.hidesBottomBarWhenPushed = YES;
    
    TopicModel *model = _dataArr[indexPath.row];
    detail.sendUrl = model.url;
    //为了上线,先跳到浏览器
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:detail.sendUrl]];
    //[self.navigationController pushViewController:detail animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
