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
@interface MainTabViewController ()
@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI
{
    MainViewController *mainvc=[AppDelegate globalDelegate].MainView;
    GuideViewController *guidevc=[AppDelegate globalDelegate].GuideView;
    mainvc.tabBarItem.badgeValue=@"10";
    [self addChildVC:@"one" ViewController:mainvc norImg:@"home" selImg:nil];
    [self addChildVC:@"two" ViewController:guidevc norImg:@"tabbar_home_selected" selImg:nil];
    [self.tab CustomCenterButton:@"cen" BackgroundImg:@"centerbtn" ButtonImg:nil];
}

@end
