//
//  TerroristViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/31.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "TerroristViewController.h"

@interface TerroristViewController ()

@end

@implementation TerroristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setMyUrl:(NSString *)keyword{
    self.keywords = @"恐怖";
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
