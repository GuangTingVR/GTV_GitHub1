//
//  MineViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/29.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MineViewController.h"
#import "CollectionViewController.h"

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)UIImageView *topImageView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor blackColor];
    self.title = @"我的设置";
    [self createTabelView];
    //[self createLogoffButton];
}


//单个文件的大小
- (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
//遍历文件夹获得文件夹大小，返回多少M
- (float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath])
        return 0;
    //通过枚举遍历法遍历文件夹中的所有文件
    //创建枚举遍历器
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    //首先声明文件名称、文件大小
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        //得到当前遍历文件的路径
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        //调用封装好的获取单个文件大小的方法
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);//转换为多少M进行返回
}
#pragma mark 清除缓存大小 打印NSHomeDritiony前往Documents进行查看路径
- (void)clearCacheFromPath:(NSString*)path{
    //建立文件管理器
    NSFileManager * manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        //如果文件路径存在 获取其中所有文件
        NSArray * fileArr = [manager subpathsAtPath:path];//找到所有子文件的路径，存到数组中。
        //首先需要转化为完整路径
        //直接删除所有子文件
        for (int i = 0; i < fileArr.count; i++) {
            NSString * fileName = fileArr[i];
            //完整路径
            NSString * filePath = [path stringByAppendingPathComponent:fileName];
            
            NSLog(@"%@",filePath);
            
            [manager removeItemAtPath:filePath error:nil];
        }
    }
}


- (void)createTabelView{
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64-49) style:UITableViewStylePlain];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.backgroundColor = [UIColor blackColor];
    _tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_tableview];
    
    _topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -120, SCREEN_W, 120)];
    _topImageView.image = [UIImage imageNamed:@"1001.jpg"];
    [_tableview addSubview:_topImageView];
    _topImageView.contentMode = UIViewContentModeScaleAspectFill;
    _topImageView.clipsToBounds = YES;
    [self.navigationController.navigationBar setClipsToBounds:YES];
    _tableview.contentInset = UIEdgeInsetsMake(120, 0, 0, 0);
    
}

//滑动检测
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    float offset = scrollView.contentOffset.y;
    if (offset < -120) {
        CGRect rect = _topImageView.frame;
        rect.origin.y = offset;
        rect.size.height = -offset;
        _topImageView.frame = rect;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = YES;
//    //透明图片
//    UIImage *image = [[UIImage alloc]init];
//    //设置导航栏的背景图片(参数2:设备的朝向 默认为竖屏)
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}


- (void)createLogoffButton{
    UIButton *logoff = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logoff.frame = CGRectMake(0, 0, SCREEN_W, 50);
    [logoff setTitle:@"切换账号" forState:UIControlStateNormal];
    [logoff addTarget:self action:@selector(logoffClick:) forControlEvents:UIControlEventTouchUpInside];
    logoff.backgroundColor = [UIColor orangeColor];
    self.tableview.tableFooterView = logoff;
}

- (void)logoffClick:(UIButton *)logoff{

//        if (!error) {
//            LoginViewController *login = [[LoginViewController alloc]init];
//            self.view.window.rootViewController = login;
//        }else{
//            NSLog(@"%@",error);
//        }

    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        //SURE_ALERT(@"查看收藏");
        CollectionViewController *collVC = [[CollectionViewController alloc]init];
        [self.navigationController pushViewController:collVC animated:YES];
        
    }
    if (indexPath.row == 1) {
        //清除缓存
        [self clearCacheFromPath:[NSString stringWithFormat:@"%@/Library/Caches",NSHomeDirectory()]];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.detailTextLabel.text =[NSString stringWithFormat:@"%0.2f",[self folderSizeAtPath:[NSString stringWithFormat:@"%@/Library/Caches",NSHomeDirectory()]]];
        SURE_ALERT(@"缓存已清空");
        //这里填写的是对应SDWebImage所缓存图片的目录
        //可根据相应需求改成相应的文件目录
    }
    
}

- (void)dayAndNight:(UISwitch*)mySwitch{
    if (mySwitch.on) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DayOrNight" object:@"1"];
    }else{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DayOrNight" object:@"2"];
    }
}


- (void)mySwitchChange:(UISwitch*)mySwitch{
    //[[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:mySwitch.on];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
//    if (indexPath.row == 0) {
//        cell.textLabel.text = @"当前用户";
//        cell.detailTextLabel.text = [UDS objectForKey:USER_NAME];
//    }else if (indexPath.row == 1) {
//        cell.textLabel.text = @"是否自动登录";
//        UISwitch * mySwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_W - 60, 6.5, 51, 31)];
//        [mySwitch addTarget:self action:@selector(mySwitchChange:) forControlEvents:UIControlEventValueChanged];
//        mySwitch.on = YES;
//        [cell.contentView addSubview:mySwitch];
//    } else
if (indexPath.row == 0){
        cell.textLabel.text = @"我的收藏";
        cell.detailTextLabel.text = @"查看收藏的宝贝";
    }else{
        cell.textLabel.text = @"系统缓存";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%0.2fM",[self folderSizeAtPath:[NSString stringWithFormat:@"%@/Library/Caches",NSHomeDirectory()]]];
    }
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}


@end
