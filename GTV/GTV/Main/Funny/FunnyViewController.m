//
//  FunnyViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/29.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "FunnyViewController.h"
#import "FunnyModel.h"
#import "FunnyCollectionViewCell.h"
#import "SXLineLayout.h"
#import "FunnyDetailViewController.h"

@interface FunnyViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic,strong) UIView *PopupView;

@property (nonatomic,strong) UICollectionView *myCV;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,assign) int page;

@property(nonatomic,copy) NSString *urlchange;

@property(nonatomic,assign) NSInteger recome;
@end

@implementation FunnyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarButtonItems];
    [self createAddView];
    [self createButton];
    //初始化数据
    [self initData];
    //设置网址
    _urlchange = URL_HOT;
    [self setMyurl:_urlchange];
    //加载数据
    [self loadData];
    //创建列表
    [self createCV];
    
}

- (void)initData{
    _dataArr = [[NSMutableArray alloc]init];
    self.page = 2;
}

- (void)setMyurl:(NSString *)url{
   
    self.url = [NSString stringWithFormat:url,_page];
}

- (void)createCV{
    // 创建布局
    SXLineLayout *layout = [[SXLineLayout alloc] init];
    // 创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) collectionViewLayout:layout];
    collectionView.center = CGPointMake(self.view.center.x, self.view.center.y);
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"FunnyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELLID"];
    [self.view addSubview:collectionView];
    self.myCV = collectionView;
    
}

- (void)loadData{
    [HttpRequest startRequestWithUrl:self.url AndParmeter:nil AndReturnBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *resultArr = dict[@"data"];
            for (NSDictionary *dic in resultArr) {
                
                //建立数据模型 存储数据
                FunnyModel *model = [[FunnyModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                //添加数据源
                [_dataArr addObject:model];
            }
            [_myCV reloadData];
            //去除加载兰
            //[MMProgressHUD dismissWithSuccess:@"加载完成"];
            
        }else{
            
            NSLog(@"%@",error.localizedDescription);
            //[MMProgressHUD dismissWithError:error.localizedDescription];
        }
        
    }];
}






- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _PopupView.frame = CGRectMake(0, 64 - 120, SCREEN_W, 120);
    
}



- (void)createButton{
    NSArray *array = @[@"热门",@"创意",@"搞笑",@"音乐",@"旅行",@"生活",@"科幻",@"萌仔"];
    for (int i=0; i<8; i++) {
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(50+i%4*(SCREEN_W/4.0-20),20 + i/4*(SCREEN_W/4.0-40), 50, 30)];
        [btn1 setTitle:array[i] forState:UIControlStateNormal];
         btn1.backgroundColor = [UIColor blackColor];
        btn1.layer.cornerRadius = 5;
         btn1.tag = 100+i;
        [btn1 addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
        [_PopupView addSubview:btn1];
    }
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    btn.center = CGPointMake(self.view.center.x, SCREEN_H - 49 - 60);
    [btn setTitle:@"换一换" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0  blue:30/255.0  alpha:1];
    btn.layer.cornerRadius = 5;
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.view.userInteractionEnabled = YES;
    [self.view addSubview:btn];
}

- (void)changeClick:(UIButton *)btn{
    if (btn.tag == 100) {
        _recome = btn.tag;
        //重新设置一下网址
        _urlchange = URL_HOT;
        [self setMyurl:_urlchange];
        [_dataArr removeAllObjects];
        [self loadData];
        [self.myCV reloadData];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:5 inSection:0];
//        [_myCV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }else if (btn.tag == 101){
        _urlchange = URL_IDEARS;
        [self setMyurl:_urlchange];
        [_dataArr removeAllObjects];
        [self loadData];
        [self.myCV reloadData];
    }else if (btn.tag == 102){
        _urlchange = URL_FUNNY;
        [self setMyurl:_urlchange];
        [_dataArr removeAllObjects];
        [self loadData];
        [self.myCV reloadData];
    }else if (btn.tag == 103){
        _urlchange = URL_MUSIC;
        [self setMyurl:_urlchange];
        [_dataArr removeAllObjects];
        [self loadData];
        [self.myCV reloadData];
    }else if (btn.tag == 104){
        _urlchange = URL_TRIP;
        [self setMyurl:_urlchange];
        [_dataArr removeAllObjects];
        [self loadData];
        [_myCV reloadData];
    }else if (btn.tag == 105){
        _urlchange = URL_LIFE;
        [self setMyurl:_urlchange];
        [_dataArr removeAllObjects];
        [self loadData];
        [_myCV reloadData];
    }else if (btn.tag == 106){
        _urlchange = URL_SF;
        [_myCV reloadData];
        [self setMyurl:_urlchange];
        [_dataArr removeAllObjects];
        [self loadData];
        [_myCV reloadData];
    }else if (btn.tag == 107){
        _urlchange = URL_ANIMATION;
        [self setMyurl:_urlchange];
        [_dataArr removeAllObjects];
        [self loadData];
        [_myCV reloadData];
    }

}

- (void)setNavBarButtonItems{
    UIBarButtonItem * RightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItemClick)];
    self.navigationItem.rightBarButtonItem = RightItem;

}

- (void)createAddView{
    
    _PopupView = [[UIView alloc] initWithFrame:CGRectMake(0, -120, SCREEN_W, 120)];
    _PopupView.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
    _PopupView.userInteractionEnabled = YES;
    [self.view addSubview:_PopupView];
    
    
    
}

- (void)click{

    
    //页数随机
    _page = 1 + arc4random()%10;
    //清空数据源重新发生网络请求
    [_dataArr removeAllObjects];
    //重新设置一下网址
    [self setMyurl:_urlchange];
    //加载数据
    [self loadData];

}



- (void)addItemClick{

    
    
    if (_PopupView.frame.origin.y < 64) {
        
        [UIView animateWithDuration:1 animations:^{
            
            _PopupView.frame = CGRectMake(0, 64, SCREEN_W, 120);
            [self.view bringSubviewToFront:_PopupView];
        }];
    }else {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _PopupView.frame = CGRectMake(0, 64 - 120, SCREEN_W, 120);
        }];
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //自定制的
    FunnyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELLID" forIndexPath:indexPath];
    
    if (indexPath.row < _dataArr.count) {
     
        FunnyModel *model = _dataArr[indexPath.row];
        [cell loadDataFromModel:model];
    }
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    //跳转详情页面
    FunnyDetailViewController *detail = [[FunnyDetailViewController alloc]init];
    
    //隐藏分栏
    detail.hidesBottomBarWhenPushed = YES;
    
    FunnyModel *model = _dataArr[indexPath.row];
    detail.sendVideourl = [NSString stringWithFormat:URL_FUNNYVIDEO,model.postid];
    [self.navigationController pushViewController:detail animated:YES];
    NSLog(@"%lu",indexPath.row);

}


/*
#pragma mark - Navigation

 FunnyModel *model = _dataArr[indexPath.row];
 NSString *playUrl = [NSString stringWithFormat:URL_FUNNYVIDEO,model.postid];
 [HttpRequest startRequestWithUrl:playUrl AndParmeter:nil AndReturnBlock:^(NSData *data, NSError *error) {
 if (!error) {
 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
 NSDictionary *dict1 = dict[@"data"][@"content"];
 NSArray *arr = dict1[@"video"];
 for (NSDictionary *dic in arr) {
 if (dic[@"qiuiu_url"]) {
 //跳转详情页面
 MovieDetailPlayViewController *detail = [[MovieDetailPlayViewController alloc]init];
 //隐藏分栏
 detail.hidesBottomBarWhenPushed = YES;
 detail.sendVideourl = dic[@"qiuiu_url"];
 [self.navigationController pushViewController:detail animated:YES];
 NSLog(@"%@",detail.sendVideourl);
 }
 
 }
 
 
 }else{
 NSLog(@"%@",error.localizedDescription);
 }
 
 }];
 
 
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
