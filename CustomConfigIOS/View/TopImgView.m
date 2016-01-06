//
//  TopImgView.m
//  CustomConfigIOS
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import "TopImgView.h"
#import "ImagePlayerView.h"
#import "NewsImg.h"
@interface TopImgView()<ImagePlayerViewDelegate>
@property (nonatomic, strong) NSArray *imageURLs;
@end
@implementation TopImgView

-(void)awakeFromNib
{
    [self setupImgScroll];
}

-(void)layoutSubviews
{
    self.w=GLScreenW;
    self.h=200;
}

/**
 *  初始化图片滚动控件
 */
-(void)setupImgScroll
{
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    
    [manager GET:GLLoadNewsImgURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *arr=[NewsImg mj_objectArrayWithKeyValuesArray:responseObject];
        if(arr.count>0)
        {
            self.imageURLs=arr;
            self.imagePlayerView.imagePlayerViewDelegate=self;
            self.imagePlayerView.scrollInterval = 5.0f;
            self.imagePlayerView.pageControlPosition = ICPageControlPosition_BottomCenter;
            self.imagePlayerView.hidePageControl = NO;
            [self.imagePlayerView reloadData];
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


#pragma mark - ImagePlayerViewDelegate
- (NSInteger)numberOfItems
{
    NSLog(@"img count:%zd",self.imageURLs.count);
    return self.imageURLs.count;
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    NewsImg *newimg=[self.imageURLs objectAtIndex:index];
    [imageView sd_setImageWithURL:[NSURL URLWithString:newimg.picurl]];
    imageView.h=200;
    
//        dispatch_async(dispatch_get_main_queue(), ^{
//            imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[self.imageURLs objectAtIndex:index]]];
//            NSLog(@"img load:%@",[self.imageURLs objectAtIndex:index]);
//        });
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NewsImg *newimg=[self.imageURLs objectAtIndex:index];
    
    if([self.delegate respondsToSelector:@selector(didClickImg:newsid:)])
    {
        [self. delegate didClickImg:imagePlayerView newsid:[newimg.nid integerValue]];
    }
}

@end
