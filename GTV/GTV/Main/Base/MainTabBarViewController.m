//
//  MainTabBarViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/29.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MovieViewController.h"
#import "FunnyViewController.h"
#import "TopicViewController.h"
#import "MineViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    self.tabBar.tintColor = [UIColor whiteColor];
    [self createTabBar];
    //默认显示第二个分栏
    self.selectedIndex = 1;
}


- (void)createTabBar{
    //视频
    MovieViewController *movie = [[MovieViewController alloc]init];
    //搞笑
    FunnyViewController*funny = [[FunnyViewController alloc]init];
    //专题
    TopicViewController *topic = [[TopicViewController alloc]init];
    //我的
    //MineViewController  *mine = [[MineViewController alloc]init];
    
    //数组VCArr
    NSMutableArray *array = [NSMutableArray arrayWithObjects:movie,funny,topic, nil];
    //标题
    NSArray *titleArr = @[@"电影",@"微影",@"专题"];
    //普通状态图片
    NSArray *normalArr = @[@"movie_normal",@"funny_normal",@"topic_normal"];
    //选中状态图片
    NSArray *selectedArr = @[@"movie_selected",@"funny_selected",@"topic_selected"];
    //for循环创建
    for (int i=0; i<array.count; i++) {
        //依次得到每个视图控制器
        UIViewController *vc = array[i];
        //转换成导航控制器
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        //**替换** 将array数组中的VC转换成nav
        [array replaceObjectAtIndex:i withObject:nav];
        //设置标题
        vc.title = titleArr[i];
        //渲染模式 保证图片的样式不更改
        UIImage *normalImage = [UIImage imageNamed:normalArr[i]];
        UIImage *selectedImage = [UIImage imageNamed:selectedArr[i]];
        //设置状态图片
        nav.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
     //分栏套导航栏套控制器
    self.viewControllers = array;
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
