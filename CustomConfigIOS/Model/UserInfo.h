//
//  UserInfo.h
//  CustomConfigIOS
//
//  Created by apple on 16/1/4.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>
@property(nonatomic,assign) NSNumber* _id;
@property (nonatomic,copy) NSString *qq;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *realname;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *mobile;
@end
