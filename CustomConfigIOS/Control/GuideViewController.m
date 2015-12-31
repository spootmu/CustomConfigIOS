//
//  GuideViewController.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "GuideViewController.h"
#import "BaseGuide.h"
@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupImg];
}

-(void)setupImg
{
    NSMutableArray *arr=[NSMutableArray array];
    
    for (int i=0;i<3; i++) {
        NSString *imgname=[NSString stringWithFormat:@"launch%zd",i+1];
        [arr addObject:imgname];
    }
    
    self.ImgUrl=arr;
}
@end
