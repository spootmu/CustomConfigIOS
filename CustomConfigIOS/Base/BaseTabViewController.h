//
//  BaseTabViewController.h
//  CustomConfigIOS
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseTab;
@interface BaseTabViewController : UITabBarController

@property(nonatomic,strong)BaseTab *tab;

/**
 *  添加Item
 *
 *  @param title  标题
 *  @param vc     控制器
 *  @param norimg 正常按钮图片
 *  @param selimg 选中按钮图片
 */
-(void)addChildVC:(NSString *)title ViewController:(UIViewController *)vc norImg:(NSString *)norimg selImg:(NSString *)selimg;

@end
