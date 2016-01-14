//
//  News.h
//  CustomConfigIOS
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    tzgg=0,
    xwxx=1
} NewsMode;

@interface NewsFile : NSObject
@property (nonatomic,copy) NSString *fid;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *path;
@end

@interface News : NSObject
@property(nonatomic,assign) NSNumber* nid;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *postdate;
@property(nonatomic,retain) NSArray *files;
@end

