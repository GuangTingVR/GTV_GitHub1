//
//  FunnyDetailViewController.m
//  GTV
//
//  Created by 梁艳广 on 16/6/4.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "FunnyDetailViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface FunnyDetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *playMovieView;
@property (nonatomic, strong) AVPlayer *player;//播放器对象
@property (nonatomic, strong) AVPlayerLayer *playerLayer;//播放器渲染图层
@property (nonatomic, assign) BOOL isFullScreen;
@property (nonatomic,copy) NSString *NewURL;
@end

@implementation FunnyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"观看V影";
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
    //[self playWithUrl:self.sendVideourl];
    [HttpRequest startRequestWithUrl:self.sendVideourl AndParmeter:nil AndReturnBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dict1 = dict[@"data"];
            _titleLabel.text = dict1[@"title"];
            _introLabel.text = dict1[@"intro"];
            _introLabel.editable = NO;
            [_imageView setImageWithURL:[NSURL URLWithString:dict1[@"image"]] placeholderImage:[UIImage imageNamed:@""]];
            NSArray *arr = dict1[@"content"][@"video"];
            NSDictionary *dict2 = arr[0];
            _NewURL = dict2[@"qiniu_url"];
            [self playWithUrl:_NewURL];
        }else{
            
        }
    }];
}


- (void)playWithUrl:(NSString*)url{
    url = _NewURL;
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
