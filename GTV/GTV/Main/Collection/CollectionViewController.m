//
//  CollectionViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/6/5.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionModel.h"
#import "TCollectionTableViewCell.h"

@interface CollectionViewController ()<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self initData];
    
    [self createTabelView];

    //加载数据
    [self loadData];
    //创建列表
}

- (void)initData{
    _dataArr = [[NSMutableArray alloc]init];
}

//- (void)setMyurl{
//    self.url = [[NSString stringWithFormat:URL_MOVIE] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//}

- (void)loadData{
    //创建DatabaseManger对象
    DatabaseManager * manager = [DatabaseManager sharedManager];

    _dataArr =[NSMutableArray arrayWithArray:[manager selectAllDatas]];
    
//    NSLog(@"%@",_dataArr);

}
- (void)createTabelView{
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-49-64) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor blackColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //_tableView.separatorStyle = NO;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    

    //右侧
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clicked:)];
    
    //xib注册cell
    [_tableView registerNib:[UINib nibWithNibName:@"TCollectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELLID"];

    
}

//点击编辑按钮 右侧编辑 删除
-(void)clicked:(UIBarButtonItem *)item{
    //设置编辑模式
    //isAdd = NO;
    //编辑模式取反
    [_tableView setEditing:!_tableView.isEditing];
}


#pragma mark 编辑模式的代理方法
//用来设置删除模式  删除还是增加
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    //如果为yes 添加模式
//    if (isAdd) {
//        return UITableViewCellEditingStyleInsert;
//        //| UITableViewCellEditingStyleDelete;
//    }
    //删除模式
    return UITableViewCellEditingStyleDelete;
    
}

#pragma mark --删除cell
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //    点击删除按键时触发的方法 indexPath 对应的是当前删除的cell
    
    //删除数据库中的数据
    //创建DatabaseManger对象
    DatabaseManager * manager = [DatabaseManager sharedManager];
    CollectionModel * model = _dataArr[indexPath.row];

    [manager deleteDataWithArray:model];
    
    
    
    //    将数据源中的数据 删除
    [_dataArr removeObjectAtIndex:indexPath.row];
    
    
    //    tableView中存在方法 可以直接将cell移除
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
   
    
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
    TCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID" forIndexPath:indexPath];
    
    
    
    if (indexPath.row < _dataArr.count) {
    
       CollectionModel *model =  _dataArr[indexPath.row];
        
        [cell loadDataFromModel:model];

    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0;
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
