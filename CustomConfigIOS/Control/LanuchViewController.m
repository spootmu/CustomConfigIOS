//
//  LanuchViewController.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "LanuchViewController.h"

#import "GuideViewController.h"
#import "MainViewController.h"
#import "LanuchViewController.h"

@interface LanuchViewController ()
@property(nonatomic,strong) AFHTTPRequestOperationManager *manager;
@property(nonatomic,strong) UIImageView *imglanuch;
@end

@implementation LanuchViewController

-(AFHTTPRequestOperationManager *)manager
{
    if(!_manager)
    {
        _manager=[AFHTTPRequestOperationManager manager];
    }
    
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self connectService];
}

-(void)setupUI
{
    UIImageView *imgv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:GLLanuchImg]];
    imgv.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:imgv];
    self.imglanuch=imgv;
}


-(void)connectService
{
    self.manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    
    [self.manager POST:GLLoadStartConfigURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic=responseObject;
        UIViewController *vc=nil;
        
        if([dic[@"isShow"] boolValue])
        {
            vc=[AppDelegate globalDelegate].GuideView;
        }
        else
        {
            vc=[AppDelegate globalDelegate].MainTab;
        }
        
        [self.view.window.layer addAnimation:[Helper ViewTransitionWithAnimationType:@"rippleEffect"] forKey:nil];
        [UIApplication sharedApplication].keyWindow.rootViewController=vc;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"err:%@",error);
        [self presentViewController:[Helper AlertWithTitle:@"ErRoR" Content:@"网络连接失败"] animated:YES completion:nil];
    }];
}

@end
