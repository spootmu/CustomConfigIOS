//
//  BaseTableViewController.h
//  CustomConfigIOS
//
//  Created by apple on 16/1/6.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "News.h"

@interface BaseTableViewController : UITableViewController
@property(nonatomic,assign) NewsMode newsmode;
@property(nonatomic,assign) BOOL ShowNewsImg;
-(void)LoadData;
@end
