//
//  TopImgView.h
//  CustomConfigIOS
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePlayerView.h"

@class TopImgView;

@protocol TopImgViewDelegate <NSObject>

-(void)didClickImg:(ImagePlayerView*)sender newsid:(NSInteger)nid;

@end

@interface TopImgView : UIView
@property (weak, nonatomic) IBOutlet ImagePlayerView *imagePlayerView;
@property(weak,nonatomic)  id<TopImgViewDelegate> delegate;;

@end
