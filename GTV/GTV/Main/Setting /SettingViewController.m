//
//  SettingViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/29.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "SettingViewController.h"
#import "TYCircleCell.h"
#import "TYCircleMenu.h"
#import "TYCircleCollectionView.h"

#import "LoveViewController.h"
#import "AnimationViewController.h"
#import "YouthViewController.h"
#import "ScienceFictionViewController.h"
#import "ActionViewController.h"
#import "FreeViewController.h"
#import "Comedy ViewController.h"

#import "MineViewController.h"
#import "VersionViewController.h"
#import "AboutMyViewController.h"

@interface SettingViewController ()<TYCircleMenuDelegate>
@property (nonatomic, strong) TYCircleCollectionView *collectionView;
@property (nonatomic, copy) NSArray *items;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    SettingViewController *set = [[SettingViewController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:set];
//    nav.title = @"1";
    
    
    self.items = @[@"免费",@"喜剧",@"爱情",@"动画",
                   @"青春",@"科技",@"动作"];
    /*  init method:
     *  radious:菜单大小（高 == 宽）
     *  itemOffset:首项的偏移距离
     */
    TYCircleMenu *menu = [[TYCircleMenu alloc]initWithRadious:220 itemOffset:0 imageArray:self.items titleArray:self.items menuDelegate:self];
    /* 以下设置为可选，不设置的时候，默认visibleNum = 4, isDismissWhenSelected = NO */
    //    menu.visibleNum = 3; //当前可见菜单数
    //    menu.isDismissWhenSelected = YES; //点击菜单项，隐藏菜单
    [self.view addSubview:menu];
}

- (IBAction)setingBtn:(id)sender {
    MineViewController *main = [[MineViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];
}
- (IBAction)versionBtn:(id)sender {
    VersionViewController *version = [[VersionViewController alloc]init];
    [self.navigationController pushViewController:version animated:YES];
}
- (IBAction)aboutMyBtn:(id)sender {
    AboutMyViewController *about = [[AboutMyViewController alloc]init];
    [self.navigationController pushViewController:about animated:YES];
}

- (void)selectMenuAtIndex:(NSInteger)index {
    NSLog(@"选中:%zd",index);
    LoveViewController *love = [[LoveViewController alloc]init];
    AnimationViewController *animation = [[AnimationViewController alloc]init];
    YouthViewController *youth = [[YouthViewController alloc]init];
    ScienceFictionViewController *scince = [[ScienceFictionViewController alloc]init];
    ActionViewController *action = [[ActionViewController alloc]init];
    FreeViewController  *free = [[FreeViewController alloc]init];
    Comedy_ViewController *comedy = [[Comedy_ViewController alloc]init];
    
    
    if (index == 0) {
        //[self presentViewController:free animated:YES completion:nil];
        [self.navigationController pushViewController:free animated:YES];
    }else if (index == 1){
        //[self presentViewController:comedy animated:YES completion:nil];
        [self.navigationController pushViewController:comedy animated:YES];
    }else if (index == 2){
        //[self presentViewController:love animated:YES completion:nil];
        [self.navigationController pushViewController:love animated:YES];
    }else if (index == 3){
        //[self presentViewController:animation animated:YES completion:nil];
        [self.navigationController pushViewController:animation animated:YES];
    }else if (index == 4){
        //[self presentViewController:youth animated:YES completion:nil];
        [self.navigationController pushViewController:youth animated:YES];
    }else if (index == 5){
        //[self presentViewController:scince animated:YES completion:nil];
        [self.navigationController pushViewController:scince animated:YES];
    }else{
        //[self presentViewController:action animated:YES completion:nil];
        [self.navigationController pushViewController:action animated:YES];
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
