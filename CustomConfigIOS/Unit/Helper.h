//
//  Helper.h
//  CustomConfigIOS
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : NSObject

/**
 *  视图切换动画
 *
 *  @param type  kCATransitionFade
 *               kCATransitionMoveIn
 *               kCATransitionPush
 *               kCATransitionReveal
 *
 *  @return 动画效果
 */
+(CATransition*)ViewTransitionWithAnimationType:(NSString*)type;


+(UIAlertController*)AlertWithTitle:(NSString*)title Content:(NSString*)content;
@end
