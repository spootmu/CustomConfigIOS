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
            [self SetupGotoButton:imgv];
        }
    }
    self.sv.contentSize=CGSizeMake(imgW*self.ImgUrl.count, imgH);
}

-(void)SetupGotoButton:(UIImageView *)iv
{
    GuidButtonGoto *btngoto=[[GuidButtonGoto alloc]init];
    btngoto.w=100;
    btngoto.h=35;
    btngoto.cx=self.view.cx;
    btngoto.cy=self.view.h-100;
    [btngoto addTarget:self action:@selector(btnGotoClick:) forControlEvents:UIControlEventTouchUpInside];
    [iv addSubview:btngoto];
    self.btnGoto=btngoto;
}

-(void)btnGotoClick:(GuidButtonGoto*)sender
{
    NSLog(@"goto");
    [UIApplication sharedApplication].keyWindow.rootViewController=[AppDelegate globalDelegate].MainTab;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end

/**
 *  尾页跳转按钮
 */
@implementation GuidButtonGoto

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor=[[UIColor purpleColor] CGColor];
        self.layer.borderWidth=2;
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:5.0];
        self.backgroundColor=[UIColor grayColor];
        self.alpha=0.5;
        [self setTintColor:[UIColor blackColor]];
        [self setTitle:@"点击进入" forState:UIControlStateNormal];
        self.titleLabel.font=[UIFont systemFontOfSize:14];
        
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}

@end
