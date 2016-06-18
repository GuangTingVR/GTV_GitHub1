//
//  FunnyCollectionViewCell.h
//  GTV
//
//  Created by 梁艳广 on 16/6/4.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FunnyModel.h"
@interface FunnyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)loadDataFromModel:(FunnyModel *)model;

@end
