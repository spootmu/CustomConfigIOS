//
//  BaseTab.h
//  CustomConfigIOS
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTab;

@protocol BaseTabDelegate <NSObject>


-(void)BaseTab:(BaseTab*) tabbar selectButtonTagFrom:(NSInteger)from selectButtonTagTo:(NSInteger)to;

-(void)Basetab:(BaseTab*) tabbar clickCenterBtn:(UIButton*)sender;

@end

@interface BaseTab : UIView
-(void)addTabBarButton:(UITabBarItem*)item;
-(void)CustomCenterButton:(NSString*)title BackgroundImg:(NSString*) bgimg ButtonImg:(NSString*) btnimg;
@property(nonatomic,weak)id<BaseTabDelegate> delegate;
@end
