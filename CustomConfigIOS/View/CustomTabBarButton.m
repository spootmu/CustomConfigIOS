//
//  CustomTabBarButton.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/30.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "CustomTabBarButton.h"
#define btnPer 0.6
@interface CustomTabBarButton()
@property(nonatomic,weak)UIButton *btnBadge;
@end

@implementation CustomTabBarButton

-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
    [_item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSString *val=self.item.badgeValue;
    if(val.integerValue)
    {
        self.btnBadge.hidden=NO;
    }
    
    if(val.integerValue==0)
    {
        self.btnBadge.hidden=YES;
    }
    
    if(val.integerValue>99)
    {
        val=@"99+";
    }
    [self.btnBadge setTitle:val forState:UIControlStateNormal];
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height*btnPer);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0,contentRect.size.height*btnPer, contentRect.size.width, contentRect.size.height-(contentRect.size.height*btnPer));
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}

-(void)setupBadge
{
    UIButton *btnBadge=[[UIButton alloc]init];
    [btnBadge setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
    btnBadge.size=btnBadge.currentBackgroundImage.size;
    btnBadge.titleLabel.font=[UIFont systemFontOfSize:8];
    [self addSubview:btnBadge];
    btnBadge.hidden=YES;
    self.btnBadge=btnBadge;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.btnBadge.x=self.w-self.btnBadge.w-5;
    self.btnBadge.y=0;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:GLRedColor forState:UIControlStateSelected];
        [self setupBadge];
    }
    return self;
}

@end
