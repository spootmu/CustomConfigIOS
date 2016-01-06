//
//  ViewNewsViewController.m
//  CustomConfigIOS
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import "ViewNewsViewController.h"

@interface ViewNewsViewController ()
@property(weak,nonatomic)UIWebView *webpage;
@end

@implementation ViewNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
}


-(void)setupUI
{
    NSString *urls=[NSString stringWithFormat:GLViewNewsURL,self.nid];
    NSLog(@"%@",urls);
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:urls]];
    
    UIWebView *webpage=[[UIWebView alloc]init];
    webpage.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [webpage loadRequest:url];
    [self.view addSubview:webpage];
    self.webpage=webpage;
}
@end
