//
//  MovieDetailPlayViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/6/2.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "MovieDetailPlayViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface MovieDetailPlayViewController ()
@property (weak, nonatomic) IBOutlet UIView *playMovieView;
@property (nonatomic, strong) AVPlayer *player;//播放器对象
@property (nonatomic, strong) AVPlayerLayer *playerLayer;//播放器渲染图层
@property (nonatomic, assign) BOOL isFullScreen;
@end

@implementation MovieDetailPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"预告片";
    [self createNavi];
    [self loadData];
}

- (void)createNavi{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:[FactoryClass createButtonWithType:UIButtonTypeCustom AndFrame:CGRectMake(0, 0, 44, 44) AndTitle:nil AndImageNamed:@"bottom_btn_back" WithState:UIControlStateNormal AndAddTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside AndParentView:nil]];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backClick:(UIBarButtonItem*)item{
    if (_isFullScreen) {
        _isFullScreen = NO;
        [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)loadData{

 
            [self playWithUrl:self.sendVideourl];

}


- (void)playWithUrl:(NSString*)url{
    if (!_player) {
        _player = [AVPlayer playerWithURL:[NSURL URLWithString:url]];
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        _playerLayer.frame = _playMovieView.bounds;
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;//视频填充模式
        [self.playMovieView.layer insertSublayer:_playerLayer atIndex:0];
        [self.playMovieView addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:nil];
    }
    [_player play];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (_playMovieView) {
        CGRect frame = [change[@"new"] CGRectValue];
        _playerLayer.frame = frame;
        if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight) {
            
        } else {
            
        }
    }
}

- (IBAction)movieFullScreenClick:(id)sender {
    _isFullScreen = YES;
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationLandscapeLeft) forKey:@"orientation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc{
    _player = nil;
    [self.playMovieView removeObserver:self forKeyPath:@"bounds"];
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
