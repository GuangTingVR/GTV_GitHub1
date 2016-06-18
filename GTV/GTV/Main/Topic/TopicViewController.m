//
//  TopicViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/29.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "TopicViewController.h"
#import "ThrillerViewController.h"
#import "TerroristViewController.h"
#import "PoliceAndGunmanViewController.h"
#import "SuspenseViewController.h"
#import "AdventureViewController.h"
#import "CrimeViewController.h"
#import "WarViewController.h"
#import "DisasterViewController.h"
@interface TopicViewController ()

@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createControllers];
}

- (void)createControllers{

    ThrillerViewController *thriller = [[ThrillerViewController alloc]init];
    TerroristViewController *terrorist = [[TerroristViewController alloc]init];
    PoliceAndGunmanViewController *police = [[PoliceAndGunmanViewController alloc]init];
    SuspenseViewController *suspense = [[SuspenseViewController alloc]init];
    AdventureViewController *adventure = [[AdventureViewController alloc]init];
    CrimeViewController *crime = [[CrimeViewController alloc]init];
    WarViewController *war = [[WarViewController alloc]init];
    DisasterViewController *disaster = [[DisasterViewController alloc]init];
    thriller.title = @"惊悚";
    terrorist.title = @"恐怖";
    police.title = @"警匪";
    suspense.title = @"悬疑";
    adventure.title = @"冒险";
    crime.title = @"犯罪";
    war.title = @"战争";
    disaster.title = @"灾难";
    //1、创建管理工具
    SCNavTabBarController * scNav = [[SCNavTabBarController alloc]init];
    //2、管理视图控制器
    scNav.subViewControllers = @[thriller,terrorist,police,suspense,adventure,crime,war,disaster];
    //颜色35 43 60 0.5
    scNav.navTabBarColor = [UIColor colorWithRed:35 / 255.0 green:43 / 255.0 blue:60 / 255.0 alpha:0.5];
    //底色55 63 80 1
    self.view.backgroundColor = [UIColor colorWithRed:55 / 255.0 green:63 / 255.0 blue:80 / 255.0 alpha:1];
    //3、执行管理
    [scNav addParentController:self];
    
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
