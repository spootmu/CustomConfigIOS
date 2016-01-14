//
//  SettingViewController.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}
- (IBAction)btnClear:(id)sender {
    
    dispatch_async(
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                   , ^{
                       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
                       NSString *tempPath = NSTemporaryDirectory();
                       
                       [self DelFileWithPath:cachPath];
                       [self DelFileWithPath:tempPath];
                       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});

}

-(void)DelFileWithPath:(NSString *)path
{
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:path];
    NSLog(@"files :%zd",[files count]);
    for (NSString *p in files) {
        NSError *error;
        NSString *lpath = [path stringByAppendingPathComponent:p];
        if ([[NSFileManager defaultManager] fileExistsAtPath:lpath]) {
            [[NSFileManager defaultManager] removeItemAtPath:lpath error:&error];
        }
    }
}

-(void)setupUI
{
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btnclear=[[UIButton alloc]init];
    btnclear.frame=CGRectMake(GLScreenW*0.5-50, 64*2, 100, 40);
    [btnclear setTitle:@"清除缓存" forState:UIControlStateNormal];
    [btnclear setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btnclear];
    [btnclear addTarget:self action:@selector(btnClear:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)clearCacheSuccess
{
    NSLog(@"清理成功");
}

@end
