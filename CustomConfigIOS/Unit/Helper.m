//
//  Helper.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "Helper.h"
#import "TabData.h"
@interface Helper()
@property(nonatomic,strong) AFHTTPRequestOperationManager *manager;
@end
@implementation Helper
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
+(CATransition *)ViewTransitionWithAnimationType:(NSString *)type
{
    CATransition *animation = [CATransition animation];
    animation.duration = 2.0;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = type;
    animation.subtype = kCATransitionFromRight;
    return animation;
}

+(UIAlertController *)AlertWithTitle:(NSString *)title Content:(NSString *)content
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionOk];
    
    return alert;
}

+(NSArray*)GetTabConfig
{
    NSURL *url=[NSURL URLWithString:GLLoadTabConfigURL];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *op=[[AFHTTPRequestOperation alloc]initWithRequest:request];
    op.responseSerializer=[AFJSONResponseSerializer serializer];
    //必须设置响应类型
    op.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [op start];
    [op waitUntilFinished];
    
    NSLog(@"temp:%@",[TabData mj_objectArrayWithKeyValuesArray:[op responseObject]]);
    
    return [TabData mj_objectArrayWithKeyValuesArray:[op responseObject]];
}


NSArray * getPropertyNameList(id object)
{
    unsigned int propertyCount = 0;
    objc_property_t * properties = class_copyPropertyList([object class], &propertyCount);
    
    NSMutableArray * propertyNames = [NSMutableArray array];
    for (unsigned int i = 0; i < propertyCount; ++i) {
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        [propertyNames addObject:[NSString stringWithUTF8String:name]];
    }
    
    return propertyNames;
}

+(UserInfo*)ReadAccount
{
    NSString *path=AccountFile;
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}
+(void)WriteAccount:(UserInfo*)account
{
    NSString *path=AccountFile;
    [NSKeyedArchiver archiveRootObject:account toFile:path];
}
@end
