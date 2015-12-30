//
//  BaseTabViewController.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "BaseTabViewController.h"
#import "BaseTab.h"
@interface BaseTabViewController ()<BaseTabDelegate>

@end

@implementation BaseTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTab];
}

/**
 *  代理实现
 *
 *  @param tabbar <#tabbar description#>
 *  @param from   <#from description#>
 *  @param to     <#to description#>
 */
-(void)BaseTab:(BaseTab *)tabbar selectButtonTagFrom:(NSInteger)from selectButtonTagTo:(NSInteger)to
{
    NSLog(@"f:%zd,t:%zd",from,to);
    self.selectedIndex=to;
}

//移除原生tabitem
-(void)viewWillAppear:(BOOL)animated
{
    
    for (UIView *sub in self.tabBar.subviews) {
        if([sub isKindOfClass:[UIControl class]])
        {
            [sub removeFromSuperview];
        }
    }
    NSLog(@"sub:%@",self.tabBar.subviews);
}

-(void)addChildVC:(NSString *)title ViewController:(UIViewController *)vc norImg:(NSString *)norimg selImg:(NSString *)selimg
{
    vc.title=title;
    vc.tabBarItem.title=title;
    vc.tabBarItem.selectedImage=[UIImage imageNamed:selimg];
    vc.tabBarItem.image=[UIImage imageNamed:norimg] ;
    BaseNav *nav=[[BaseNav alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    [self.tab addTabBarButton:vc.tabBarItem];
}

-(void)Basetab:(BaseTab *)tabbar clickCenterBtn:(UIButton *)sender
{
    NSLog(@"centerClick");
}

/**
 *  添加自定义tab
 */
-(void)setupTab
{
    CGRect rect = self.tabBar.bounds;
    
    BaseTab *tab=[[BaseTab alloc]init];
    tab.frame=rect;
    tab.delegate=self;
    [self.tabBar addSubview:tab];
    self.tab=tab;
    
    NSLog(@"%@",self.tabBar.subviews);
}
@end
