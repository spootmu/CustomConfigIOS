//
//  ViewNewsViewController.h
//  CustomConfigIOS
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
@interface ViewNewsViewController : UIViewController
@property(nonatomic,strong) News *news;
@property (nonatomic,assign) NSInteger nid;
@end
