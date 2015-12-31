//
//  BaseGuide.h
//  CustomConfigIOS
//
//  Created by apple on 15/12/31.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GuidButtonGoto;

@interface BaseGuide : UIViewController
@property (nonatomic,strong) NSArray *ImgUrl;
@property(nonatomic,strong) GuidButtonGoto *btnGoto;
@end


@interface GuidButtonGoto : UIButton

@end