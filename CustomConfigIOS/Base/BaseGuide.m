//
//  BaseGuide.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/31.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "BaseGuide.h"

@interface BaseGuide ()<UIScrollViewDelegate>
@property(nonatomic,weak)UIScrollView *sv;

@property(nonatomic,weak)UIPageControl *page;
@end

@implementation BaseGuide

-(void)setImgUrl:(NSArray *)ImgUrl
{
    _ImgUrl=ImgUrl;
    [self setupScrollView];
    [self setupPageControl];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setupPageControl
{
    //不需要设置大小，此控件大小自动
    UIPageControl *page=[[UIPageControl alloc]init];
    page.cx=self.view.cx;
    page.cy=self.view.h-30;
    //    page.pageIndicatorTintColor=[UIColor greenColor];
    //    page.currentPageIndicatorTintColor=[UIColor redColor];
    page.numberOfPages=self.ImgUrl.count;
    [self.view addSubview:page];
    self.page=page;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page=scrollView.contentOffset.x/scrollView.frame.size.width;
    self.page.currentPage=page;
    //    Log(@"%zd",page);
}

-(void)setupScrollView
{
    CGFloat imgW=[UIScreen mainScreen].bounds.size.width;
    CGFloat imgH=[UIScreen mainScreen].bounds.size.height;
    CGFloat imgY=0;
    
    UIScrollView *sv=[[UIScrollView alloc]init];
    sv.backgroundColor=[UIColor redColor];
    sv.frame=self.view.bounds;
    sv.delegate=self;
    sv.pagingEnabled=YES;
    sv.showsHorizontalScrollIndicator=NO;
    sv.bounces=NO;
    [self.view addSubview:sv];
    self.sv=sv;
    
    for (int i=0; i<self.ImgUrl.count; i++) {
        NSString *imgName=self.ImgUrl[i];
        CGFloat imgX=imgW*i;
        UIImageView *imgv=[[UIImageView alloc]init];
        imgv.image=[UIImage imageNamed:imgName];
        imgv.frame=CGRectMake(imgX, imgY, imgW, imgH);
        [self.sv addSubview:imgv];
        if(i==self.ImgUrl.count-1)
        {
            imgv.userInteractionEnabled=YES;
            NSLog(@"last");
        }
    }
    self.sv.contentSize=CGSizeMake(imgW*self.ImgUrl.count, imgH);
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
