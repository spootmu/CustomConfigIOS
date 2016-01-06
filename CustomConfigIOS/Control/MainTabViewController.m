//
//  MainTabViewController.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "MainTabViewController.h"
#import "MainViewController.h"
#import "GuideViewController.h"
#import "BaseTab.h"
#import "TabData.h"
@interface MainTabViewController ()
@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI
{
//    [self.tab CustomCenterButton:@"cen" BackgroundImg:@"centerbtn" ButtonImg:nil];

    for (TabData *data in [Helper GetTabConfig])
    {
       UIViewController *vc=[[[((UIViewController*)NSClassFromString(data.clsname)) class]alloc]init];
       [self addChildVC:data.title ViewController:vc norImg:data.imgName selImg:data.imgSelName];
    }
}

@end
