//
//  BaseNav.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "BaseNav.h"

@interface BaseNav ()

@end

@implementation BaseNav

+(void)initialize
{
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName]=[UIColor whiteColor];
    dic[NSFontAttributeName]=[UIFont systemFontOfSize:18.0];
    
    UINavigationBar *bar=[UINavigationBar appearance];
    bar.tintColor=[UIColor whiteColor];
    bar.titleTextAttributes=dic;
    bar.barTintColor=GLRedColor;
    
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    
    NSMutableDictionary *dicHighlight=[NSMutableDictionary dictionaryWithDictionary:dic];
    dicHighlight[NSForegroundColorAttributeName]=[UIColor blackColor];
    
    [item setTitleTextAttributes:dicHighlight forState:UIControlStateHighlighted];
    
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.childViewControllers.count>0)
    {
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
