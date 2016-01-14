//
//  ViewNewsViewController.m
//  CustomConfigIOS
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import "ViewNewsViewController.h"
#import <QuickLook/QLPreviewController.h>
#import "PreviewViewController.h"
#import <TCBlobDownload/TCBlobDownload.h>
#import "News.h"
@interface ViewNewsViewController ()<QLPreviewControllerDataSource,QLPreviewControllerDelegate>
@property(weak,nonatomic)UIWebView *webpage;
@property(copy,nonatomic)NSString *fp;
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
    NSString *urls=@"";
    if(self.news==nil)
    {
        urls=[NSString stringWithFormat:GLViewNewsURL,self.nid];
    }
    else
    {
        urls=[NSString stringWithFormat:GLViewNewsURL,[self.news.nid integerValue]];
    }
    
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:urls]];
    
    UIWebView *webpage=[[UIWebView alloc]init];
    webpage.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [webpage loadRequest:url];
    
    
    
    [self.view addSubview:webpage];
    self.webpage=webpage;
    
    if(self.news.files.count>0)
    {
        NewsFile *nf    = self.news.files[0];
        CGFloat navH    = 50.0;
        CGFloat statusH = 14;
        UIView *vfoot=[[UIView alloc]init];
        NSLog(@"navH:%zd",navH);
        vfoot.frame      = CGRectMake(0, GLScreenH-navH*2-statusH, GLScreenW,navH);
        vfoot.backgroundColor=[UIColor grayColor];
        [self.view addSubview:vfoot];

        UIButton *btnpreview=[[UIButton alloc]init];
        [btnpreview setTitle:@"预览附件" forState:UIControlStateNormal];
        [btnpreview setBackgroundColor:[UIColor yellowColor]];
        [btnpreview setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnpreview.frame = CGRectMake(GLScreenW*0.5-50, navH*0.5-20, 100, 40);
        [btnpreview addTarget:self action:@selector(btnPreviewClick) forControlEvents:UIControlEventTouchUpInside];
        [vfoot addSubview:btnpreview];
    }
    
}

-(void)btnPreviewClick
{
    if(self.news.files.count>0)
    {

        TCBlobDownloadManager *manager=[TCBlobDownloadManager sharedInstance];

        NewsFile *nf = self.news.files[0];
        NSLog(@"path:!!!!!%@",nf.path);
    //    NSString *customPath = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",nf.name]];

        TCBlobDownloader *download=[manager startDownloadWithURL:[NSURL URLWithString:nf.path] customPath:nil firstResponse:^(NSURLResponse *response) {

        } progress:^(uint64_t receivedLength, uint64_t totalLength, NSInteger remainingTime, float progress) {

        } error:^(NSError *error) {

        } complete:^(BOOL downloadFinished, NSString *pathToFile) {

            NSFileManager *fm=[NSFileManager defaultManager];
            NSString *newpath=[NSTemporaryDirectory() stringByAppendingPathComponent:nf.name];
            [fm copyItemAtPath:pathToFile toPath:newpath error:nil];
            [fm removeItemAtPath:pathToFile error:nil];

            self.fp                      = newpath;
            PreviewViewController *qlvc=[[PreviewViewController alloc]init];
            qlvc.dataSource              = self;
            qlvc.delegate                = self;
            qlvc.currentPreviewItemIndex = 0;
            [self.navigationController pushViewController:qlvc animated:YES];
        }];
    }
}

#pragma PreviewViewController Delegate
-(NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}

-(BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id<QLPreviewItem>)item
{
    return YES;
}

-(id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    return [NSURL fileURLWithPath:self.fp];
}
@end
