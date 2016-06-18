//
//  ScienceFictionViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/31.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "ScienceFictionViewController.h"

@interface ScienceFictionViewController ()

@end

@implementation ScienceFictionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self createButton];
    self.view.backgroundColor = [UIColor blackColor];
}
- (void)createButton{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, SCREEN_W, 44)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:btn];
}

- (void)btnBack:(UIButton *)btn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setMyUrl:(NSString *)keyword{
    self.keywords = @"科幻";
    NSDictionary *dicParams = PARAMS;
    self.dicMutable = [NSMutableDictionary dictionaryWithDictionary:dicParams];
    [self.dicMutable setObject:self.keywords forKey:@"keyword"];
    [self.dicMutable setObject:[NSString stringWithFormat:@"%d",self.page] forKey:@"page"];
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
