//
//  TopicSetingBaseViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/6/1.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "TopicSetingBaseViewController.h"
#import "TopicModel.h"
#import "TopicCollectionViewCell.h"

#import "TopicDetailViewController.h"

@interface TopicSetingBaseViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation TopicSetingBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"影片列表";
    self.view.backgroundColor = [UIColor blackColor];
    //初始化数据
    [self initData];
    //设置网址
    _keywords = @"喜剧";
    [self setMyUrl:_keywords];
    //加载数据
    [self loadData];
    //创建列表
    [self createCollectionView];
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
            [_collectionView reloadData];
            
            //去除下拉刷新空间动作
            [_collectionView.header endRefreshing];
            //去除上拉加载空间动作
            [_collectionView.footer endRefreshing];
            //去除加载兰
            [MMProgressHUD dismissWithSuccess:@"success"];
            
            
        }else{
            NSLog(@"%@",error.localizedDescription);
            //去除下拉刷新空间空间动作
            [_collectionView.header endRefreshing];
            [_collectionView.footer endRefreshing];
            //去除加载兰
            [MMProgressHUD dismissWithError:error.localizedDescription];
        }
        
    }];

}

- (void)createCollectionView{
    
    //在创建之前需要布局对象
    UICollectionViewFlowLayout * flowlay = [[UICollectionViewFlowLayout alloc]init];
    //设置CV的一些属性(两个cell之间最小距离)
    flowlay.minimumInteritemSpacing = 5;
    //设置两行之间的最小距离
    flowlay.minimumLineSpacing = 5;
    //设置cell的大小
    flowlay.itemSize = CGSizeMake(SCREEN_W/3-10, SCREEN_H/4);
    //设置滑动的方向
    flowlay.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64) collectionViewLayout:flowlay];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    //xib方式
    [_collectionView registerNib:[UINib nibWithNibName:@"TopicCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELLID"];
    
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
    self.collectionView.header  =  header;
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
    self.collectionView.footer  =  footer;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --datasource
#pragma mark  required 黄金三法则
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        return _dataArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //自定制的
    TopicCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELLID" forIndexPath:indexPath];
    
    if (indexPath.row < _dataArr.count) {
        TopicModel *model = _dataArr[indexPath.row];
        [cell loadDataFromModel:model];
    }
    return cell;
    
    
}



//调整Item的位置 使Item不紧挨着屏幕
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //在原有基础上进行调整 上 左 下 右
    return UIEdgeInsetsMake(0, 10, 0, 10);
}




#pragma mark --cell点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // NSLog(@"%lu",indexPath.row);
    //去除默认停留效果
    [_collectionView deselectItemAtIndexPath:indexPath animated:YES];
    TopicDetailViewController * detail = [[TopicDetailViewController alloc]init];
    //隐藏下方的标签栏控制器
    detail.hidesBottomBarWhenPushed = YES;
    //获取到所点击行ID
    TopicModel * model = _dataArr[indexPath.row];
    detail.sendUrl = model.url;
    //[self presentViewController:detail animated:YES completion:nil];
    //[self.navigationController pushViewController:detail animated:YES];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:detail.sendUrl]];    
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
