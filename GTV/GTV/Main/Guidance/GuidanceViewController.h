//
//  GuidanceViewController.h
//  GTCLF
//
//  Created by 梁艳广 on 16/5/25.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Myblock)(void);

@interface GuidanceViewController : UIViewController
- (instancetype)initWithImages:(NSArray *)images andBlock:(Myblock)block;
@end
