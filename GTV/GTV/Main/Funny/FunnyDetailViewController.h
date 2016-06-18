//
//  FunnyDetailViewController.h
//  GTV
//
//  Created by 梁艳广 on 16/6/4.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunnyDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *introLabel;

@property (nonatomic,strong) NSString *sendVideourl;

@end
