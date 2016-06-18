//
//  MovieBaseViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/30.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MovieBaseViewController.h"
#import "MovieModel.h"
#import "MovieTableViewCell.h"
#import "MovieDetailViewController.h"

#import "isOKModel.h"

@interface MovieBaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) int count;
@end

@implementation MovieBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self initData];
    //设置网址
    [self setMyurl];
    //加载数据
    [self loadData];
    //创建列表
    [self createTabelView];
}

- (void)initData{
    _dataArr = [[NSMutableArray alloc]init];
}

- (void)setMyurl{
    self.url = [[NSString stringWithFormat:URL_MOVIE] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (void)loadData{
    
    _dataIsok = [[NSMutableArray alloc]init];

    [HttpRequest startRequestWithUrl:self.url AndParmeter:nil AndReturnBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dict1 = dict[@"data"];
            NSArray *arr = dict1[@"hot"];
            NSDictionary *dict2 = [arr firstObject];
            NSArray *arr1 = dict2[@"movies"];
            for (NSDictionary * newsDict in arr1) {
                //建立数据模型
                MovieModel * model = [[MovieModel alloc]init];
                [model setValuesForKeysWithDictionary:newsDict];
                [_dataArr addObject:model];
                
                
                isOKModel * is = [[isOKModel alloc]init];
                is.isok = NO;
                [_dataIsok addObject:is];
                
            
                
            }
            //刷新TableView
            [_tableView reloadData];
            //去除下/上拉刷新控件
            [_tableView.header endRefreshing];
            //[_tableView.footer endRefreshing];
            //去除加载栏
            //[MMProgressHUD dismissWithSuccess:@"success"];
            
        }else{
            //去除下/上拉刷新控件
            [_tableView.header endRefreshing];
            //[_tableView.footer endRefreshing];
            //去除加载栏
            //[MMProgressHUD dismissWithError:error.localizedDescription];
        }
    }];

}


- (void)createTabelView{
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-49-94) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor lightGrayColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELLID"];
    
    //xib注册cell
    [_tableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELLID"];
    
    //下拉刷新
    [self addDropDownRefresh];
    //上拉加载
    //[self addDropUpRefresh];
    
}

#pragma mark --下拉刷新
- (void)addDropDownRefresh{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        //下拉刷新的操作
        //清空数据源重新发生网络请求
        [_dataArr removeAllObjects];
        //重新设置一下网址
        [self setMyurl];
        //加载数据
        [self loadData];
    }];
    //设置刷新中的动画
    NSArray *imagesArr = @[[UIImage imageNamed:@"blackpao1"],[UIImage imageNamed:@"blackpao2"],[UIImage imageNamed:@"blackpao3"]];
    //正在刷新中的动画状态
    [header setImages:imagesArr forState:MJRefreshStateRefreshing];
    self.tableView.header  =  header;
}


#pragma mark --上拉加载
- (void)addDropUpRefresh{
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        //下拉刷新的操作
        //清空数据源重新发生网络请求
        [_dataArr removeAllObjects];
        //重新设置一下网址
        [self setMyurl];
        //加载数据
        [self loadData];
    }];
    //设置刷新中的动画
    NSArray *imagesArr = @[[UIImage imageNamed:@"blackpao1"],[UIImage imageNamed:@"blackpao2"],[UIImage imageNamed:@"blackpao3"]];
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
    
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID" forIndexPath:indexPath];
    
    if (indexPath.row < _dataArr.count) {
        MovieModel *model = _dataArr[indexPath.row];
        
        cell.collectss.tag = indexPath.row + 1000;
        [cell.collectss addTarget:self action:@selector(collectssClick:) forControlEvents:UIControlEventTouchUpInside];

        [cell loadDataFromModel:model];
        
    }
    return cell;
}


- (void)collectssClick:(UIButton *)btn{
    
    btn.selected = !btn.selected;
    
    NSInteger index = btn.tag - 1000;
    
    MovieModel * model = _dataArr[index];
    
    if (btn.selected) {
        
        model.isSelected = YES;
    }else {
        model.isSelected = NO;
    }
    
    [_dataArr replaceObjectAtIndex:index withObject:model];
    
    //刷新某个 cell
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    

    //创建DatabaseManger对象
    DatabaseManager * manager = [DatabaseManager sharedManager];
    
    if (model.isSelected == YES) {
       [manager insertDataWithModel:model];
    }else{
       [manager deleteDataWithArray1:model];
    }
    
    //NSLog(@"%@",model);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    DatabaseManager * manager = [DatabaseManager sharedManager];
//    NSMutableArray *dataArr1 =[NSMutableArray arrayWithArray:[manager selectAllDatas]];
//    for (CollectionModel *model in dataArr1) {
//        for (MovieModel *model1 in _dataArr) {
//            if ([model.Moivenm isEqualToString:model1.nm]) {
//                
//            }
//        }
//    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100.0;
}


#pragma mark --cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //除去默认停留效果()
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //跳转详情页面
    MovieDetailViewController *detail = [[MovieDetailViewController alloc]init];
    
    //隐藏分栏
    detail.hidesBottomBarWhenPushed = YES;
    
    MovieModel *model = _dataArr[indexPath.row];
    detail.sendUrl = [NSString stringWithFormat:@"%@",model.ID];
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
