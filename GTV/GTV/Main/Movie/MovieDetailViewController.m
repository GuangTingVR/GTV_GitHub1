//
//  MovieDetailViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/6/2.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieDetailModel.h"
#import "MovieDetailTableViewCell.h"
#import "MovieDetailPlayViewController.h"

@interface MovieDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
//列表
@property(nonatomic,strong) UITableView *tableView;
//数据源
@property(nonatomic,strong) NSMutableArray *dataArr;
//设置网址
@property(nonatomic,strong) NSString *url;
//
- (void)setMyurl;
//请求数据
- (void)loadData;
@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影详情";
    [self initData];
    [self setMyurl];
    [self loadData];
    [self createTabelView];
}


- (void)initData{
    _dataArr = [[NSMutableArray alloc]init];
}

- (void)setMyurl{
    self.url = [NSString stringWithFormat:URL_MOVIEDETAIL,_sendUrl];
}

- (void)loadData{
    NSLog(@"%@",self.url);
    [HttpRequest startRequestWithUrl:self.url AndParmeter:nil AndReturnBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dict1 = dict[@"data"][@"movie"];

                MovieDetailModel * model = [[MovieDetailModel alloc]init];
                [model setValuesForKeysWithDictionary:dict1];
                [_dataArr addObject:model];
            
            //刷新TableView
            [_tableView reloadData];

        }else{

        }
    }];
}

- (void)createTabelView{
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    
    //xib注册cell
    [_tableView registerNib:[UINib nibWithNibName:@"MovieDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELLID"];
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
    MovieDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID" forIndexPath:indexPath];
    
    if (indexPath.row < _dataArr.count) {
        MovieDetailModel *model = _dataArr[indexPath.row];
        [cell loadDataFromModel:model];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SCREEN_H;
}


#pragma mark --cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //除去默认停留效果()
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //跳转详情页面
    MovieDetailPlayViewController *detail = [[MovieDetailPlayViewController alloc]init];
    
    //隐藏分栏
    detail.hidesBottomBarWhenPushed = YES;
    
    MovieDetailModel *model = _dataArr[indexPath.row];
    detail.sendVideourl = [NSString stringWithFormat:@"%@",model.videourl];
    [self.navigationController pushViewController:detail animated:YES];
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
