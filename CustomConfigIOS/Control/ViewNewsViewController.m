//
//  ViewNewsViewController.m
//  CustomConfigIOS
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import "ViewNewsViewController.h"

@interface ViewNewsViewController ()<UIWebViewDelegate>
@property(weak,nonatomic)UIWebView *webpage;
@end

@implementation ViewNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    [webView stringByEvaluatingJavaScriptFromString:
//     @"var script = document.createElement('script');"
//     "script.type = 'text/javascript';"
//     "script.text = \"function ResizeImages() { "
//     "var myimg,oldwidth;"
//     "var maxwidth = 375.0;" // UIWebView中显示的图片宽度
//     "for(i=0;i <document.images.length;i++){"
//     "myimg = document.images[i];"
//     "if(myimg.width > maxwidth){"
//     "oldwidth = myimg.width;"
//     "myimg.width = maxwidth;"
//     "}"
//     "}"
//     "}\";"
//     "document.getElementsByTagName('head')[0].appendChild(script);"];
//    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
}

-(void)setupUI
{
    NSString *urls=[NSString stringWithFormat:GLViewNewsURL,self.nid];
    NSLog(@"%@",urls);
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:urls]];
    
    UIWebView *webpage=[[UIWebView alloc]init];
//    webpage.scalesPageToFit=YES;
    webpage.delegate=self;
    webpage.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [webpage loadRequest:url];
    
    
    
    [self.view addSubview:webpage];
    self.webpage=webpage;
}
@end
