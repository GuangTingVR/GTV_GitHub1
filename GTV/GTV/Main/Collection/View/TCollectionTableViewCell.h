//
//  TCollectionTableViewCell.h
//  GTV
//
//  Created by 梁艳广 on 16/6/5.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionModel.h"

@interface TCollectionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *nmLabel;


- (void)loadDataFromModel:(CollectionModel *)model;

@end
