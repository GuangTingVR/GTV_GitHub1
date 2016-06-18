//
//  WillBeMovieViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/30.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "WillBeMovieViewController.h"
#import "MovieModel.h"
@interface WillBeMovieViewController ()

@end

@implementation WillBeMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setMyurl{
    self.url = [[NSString stringWithFormat:URL_MOVIETOP] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (void)loadData{
    [HttpRequest startRequestWithUrl:self.url AndParmeter:nil AndReturnBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dict1 = dict[@"data"];
            NSArray *arr1 = dict1[@"coming"];
            for (NSDictionary * newsDict in arr1) {
                NSArray *arr2 = newsDict[@"movies"];
                for (NSDictionary *newsDict1 in arr2) {
                    //建立数据模型
                    MovieModel * model = [[MovieModel alloc]init];
                    [model setValuesForKeysWithDictionary:newsDict1];
                    [self.dataArr addObject:model];
                }
            }
            //刷新TableView
            [self.tableView reloadData];
            //去除下/上拉刷新控件
            [self.tableView.header endRefreshing];
            //[_tableView.footer endRefreshing];
            //去除加载栏
            //[MMProgressHUD dismissWithSuccess:@"success"];
            
        }else{
            //去除下/上拉刷新控件
            [self.tableView.header endRefreshing];
            //[_tableView.footer endRefreshing];
            //去除加载栏
            //[MMProgressHUD dismissWithError:error.localizedDescription];
        }
    }];
    
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
