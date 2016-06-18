//
//  MovieViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/29.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MovieViewController.h"
#import "IsHotMovieViewController.h"
#import "WillBeMovieViewController.h"

@interface MovieViewController ()

@property (nonatomic,strong) IsHotMovieViewController *hotVC;
@property (nonatomic,strong) WillBeMovieViewController *willbeVC;


@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createNavLeftItem];
    [self createControllers];
    [self createSegment];
    
}

#pragma mark 导航栏自定制左item
- (void)createNavLeftItem{
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
//    [btn addTarget:self action:@selector(leftMemuClick:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setImage:[UIImage imageNamed:@"profile"] forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
//    UIBarButtonItem *Item = [[UIBarButtonItem alloc]initWithCustomView: btn];
//    btn.layer.cornerRadius = 5;
//    self.navigationItem.leftBarButtonItem = Item;
    
    
    UIBarButtonItem *LeftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(leftMemuClick)];
    self.navigationItem.leftBarButtonItem = LeftItem;
    
}

#pragma mark -- 打开或者关闭左右菜单
- (void)leftMemuClick{
    //点一下打开 再点一下 关闭
    // 1.获取容器控制器
    MMDrawerController *drawer = [self mm_drawerController];
    // 2.判断当前菜单的打开/关闭状态
    if([drawer openSide] == MMDrawerSideLeft){
        //关闭当前打开的菜单
        [drawer closeDrawerAnimated:YES completion:^(BOOL finished) {
            //关闭时触发的block
            NSLog(@"关闭左菜单");
        }];
        
    }else if ([drawer openSide] == MMDrawerSideNone){
        // 没有菜单打开
        [drawer openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
            NSLog(@"打开左菜单");
        }];
    }
}


- (void)createControllers{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _hotVC = [[IsHotMovieViewController alloc]init];
    _willbeVC = [[WillBeMovieViewController alloc]init];
    //这个顺序有关默认是桌面的位置0的位置
    [self.view addSubview:_willbeVC.view];
    [self.view addSubview:_hotVC.view];
    
    _hotVC.view.frame = CGRectMake(0, 94, SCREEN_W, SCREEN_H-94-49);
    _willbeVC.view.frame = CGRectMake(0, 94, SCREEN_W, SCREEN_H-94-49);
    
    [self addChildViewController:_hotVC];
    [self addChildViewController:_willbeVC];
}
- (void)createSegment{
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"正在热映",@"即将上映"]];
    seg.frame = CGRectMake((SCREEN_W-140)/2.0, 64, 140, 30);
    [seg addTarget:self action:@selector(segChange:) forControlEvents:UIControlEventValueChanged];
    //默认是桌面的位置0的位置
    seg.selectedSegmentIndex = 0;
    //设置样式
    [seg setTintColor:[UIColor darkGrayColor]];
    //设置字体样式
    [seg setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [self.view addSubview:seg];
}

- (void)segChange:(UISegmentedControl *)seg{
    //切换视图的层次
    if (seg.selectedSegmentIndex == 0) {
        [self.view bringSubviewToFront:_hotVC.view];
    }else{
        [self.view bringSubviewToFront:_willbeVC.view];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
