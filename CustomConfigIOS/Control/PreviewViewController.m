//
//  PreviewViewController.m
//  CustomConfigIOS
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationController.navigationBarHidden=YES;
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(hidebtn) userInfo:nil repeats:YES];
//    [[self navigationItem] setRightBarButtonItem:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title=@"sdf";
    }
    return self;
}

-(void)hidebtn
{
    [[self navigationItem] setRightBarButtonItem:nil];
//    self.title=@"sdf";
}

@end
