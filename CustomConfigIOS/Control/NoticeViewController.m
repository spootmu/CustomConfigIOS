//
//  NoticeViewController.m
//  CustomConfigIOS
//
//  Created by apple on 16/1/6.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import "NoticeViewController.h"

@interface NoticeViewController ()

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newsmode=0;
    self.ShowNewsImg=false;
    [self LoadData];
}


@end
