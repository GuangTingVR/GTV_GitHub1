//
//  TopicDetailViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/5/31.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "TopicDetailViewController.h"

@interface TopicDetailViewController ()
//网页视图
@property (nonatomic,strong) UIWebView * webView;
//播放器
//@property (nonatomic, strong) MPMoviePlayerController * moviePlayer;

@property (nonatomic,strong) UIButton *button;
@end

@implementation TopicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"欢迎观影";
    self.view.backgroundColor = [UIColor blackColor];
    [self createWebView];
    //[self createButton];
    
}

- (void)createButton{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_H-44, SCREEN_W, 44)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:btn];
}

- (void)btnBack:(UIButton *)btn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



//- (void)click:(UIButton *)btn
//{
//    
//    if (_moviePlayer == nil) {
//        _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:_sendUrl]];
//        NSLog(@"%@",_sendUrl);
//        _moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
//        _moviePlayer.controlStyle = MPMovieControlStyleDefault;
//        [self.view addSubview:_moviePlayer.view];
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector: @selector(playbackFinished4MoviePlayerController:)
//                                                     name:MPMoviePlayerPlaybackDidFinishNotification
//                                                   object:nil];
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(doneButtonClick:)
//                                                     name:MPMoviePlayerWillExitFullscreenNotification
//                                                   object:nil];
//    }
//    
//    [_moviePlayer play];
//    [_moviePlayer setFullscreen:YES animated:YES];
//}
//
//- (void) playbackFinished4MoviePlayerController: (NSNotification*) notification
//{
//    NSLog(@"使用MPMoviePlayerController播放完成.");
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [_moviePlayer stop];
//    [_moviePlayer.view removeFromSuperview];
//    _moviePlayer = nil;
//}
//
//-(void)doneButtonClick:(NSNotification*)aNotification
//{
//    NSLog(@"退出全屏.");
//    if (_moviePlayer.playbackState == MPMoviePlaybackStateStopped)
//    {
//        [_moviePlayer.view removeFromSuperview];
//        _moviePlayer = nil;
//    }
//}



- (void)createWebView{
    //更改导航栏样式 黑色
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //左上角字体的颜色
    //self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    //关掉自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, -5, SCREEN_W, SCREEN_H+5)];
    _webView.backgroundColor = [UIColor blackColor];
    //网址
    //通过网址生成请求体
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_sendUrl]];
    //网页视图加载请求体
    [_webView loadRequest:request];
    
    [self.view addSubview:_webView];

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
