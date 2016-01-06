//
//  MainViewController.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "MainViewController.h"
#import "SettingViewController.h"
#import "TopImgView.h"
#import "ViewNewsViewController.h"
#import "News.h"
#import "BaseTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.newsmode=1;
    self.ShowNewsImg=true;
    [self LoadData];
}
@end
