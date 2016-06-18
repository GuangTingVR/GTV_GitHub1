//
//  GuidanceViewController.m
//  GTCLF
//
//  Created by 梁艳广 on 16/5/25.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "GuidanceViewController.h"

@interface GuidanceViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollview;

@property(nonatomic,strong)NSMutableArray *imagesArr;

@property(nonatomic,copy)Myblock block;

@end

@implementation GuidanceViewController

#pragma mark --自定义构造方法
- (instancetype)initWithImages:(NSArray *)images andBlock:(Myblock)block{
    self = [super init];
    if (self) {
        //接收从外部传入的数据
        _imagesArr = [NSMutableArray arrayWithArray:images];
        //
        _block = block;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    [self createScrollView];
}

#pragma mark --创建 SC
- (void)createScrollView{
    //创建ScrollView
    _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //contentSize长度
    _scrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * _imagesArr.count, [UIScreen mainScreen].bounds.size.height);
    //设置代理
    _scrollview.delegate = self;
    //开启翻页模式
    _scrollview.pagingEnabled = YES;
    //防止自动下滑(任何控制器的一个属性)
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:_scrollview];
    
    [self addSubViewsOfScrollview];
    
}

#pragma mark --scrollview 添加 subviews
- (void)addSubViewsOfScrollview{
    
    //添加 imageview 展示图片  添加 button
    //imageview  和 label 在某些情况下添加 button 点击 button 没有任何效果
    //button 添加到 scrollview 上可显示范围的最后一页 在 imageview上
    
    for (int i=0; i<_imagesArr.count; i++) {
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
        imageview.image = [UIImage imageNamed:_imagesArr[i]];
        
        [_scrollview addSubview:imageview];
        
    }
    
    //2.添加 button
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_W - 150)/2.0 + SCREEN_W *(_imagesArr.count - 1), SCREEN_H - 60, 150, 50)];
    //颜色
    btn.backgroundColor = [UIColor orangeColor];
    
    [btn setTitle:@"马上体验" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnclicked:) forControlEvents:UIControlEventTouchUpInside];
    //边框的宽
    btn.layer.borderWidth = 1;
    //边框的颜色
    btn.layer.borderColor = [UIColor cyanColor].CGColor;
    //切圆
    btn.layer.cornerRadius = 8;
    //切(超出范围的切掉)
    btn.layer.masksToBounds = YES;
    //添加到 SV 上
    [_scrollview addSubview:btn];
    
    
}

- (void)btnclicked:(UIButton *)btn{
    
    //1.修改本地关于是否安装的标记
    //使用用户偏好设置
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    //加一个标记
    [def setInteger:1 forKey:@"IS_INSTALL"];
    //持久化  可以省略不写 返回值是 bool 用于判断本地是否写入
    [def synchronize];
    
    //2.还原状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    //3.回调 block 切换根控制器
    
    _block();
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
