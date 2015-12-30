//
//  BaseTab.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "BaseTab.h"
#import "CustomTabBarButton.h"
@interface BaseTab()
@property(nonatomic,strong) NSMutableArray *arrBtns;
@property(nonatomic,weak) CustomTabBarButton *btnSelNow;
@property(weak,nonatomic) UIButton *btnCenter;
@end
@implementation BaseTab

-(NSMutableArray *)arrBtns
{
    if(!_arrBtns)
    {
        _arrBtns=[NSMutableArray array];
    }
    return _arrBtns;
}

//-(UIButton *)btnCenter
//{
//    if(_btnCenter==nil)
//    {
//        UIButton *btnCenter=[[UIButton alloc]init];
//        [btnCenter setBackgroundImage:[UIImage imageNamed:@"centerbtn"] forState:UIControlStateNormal];
//        [self addSubview:btnCenter];
//        _btnCenter=btnCenter;
//    }
//    return _btnCenter;
//}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self setupOtherBtnFrame];
    [self setupCenterBtnFrame];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg"]];
    }
    return self;
}

-(void)setupOtherBtnFrame
{
    for (int i=0; i<self.arrBtns.count; i++) {
        CustomTabBarButton *btn=self.arrBtns[i];
        if(self.btnCenter!=nil)
        {
            btn.w=self.w/(self.arrBtns.count+1);
        }else
        {
            btn.w=self.w/self.arrBtns.count;
        }
        btn.h=self.h;
        btn.y=0;
        btn.tag=i;
        if(i>=self.arrBtns.count/2)
        {
            if(self.btnCenter!=nil)
            {
                btn.x=(i+1)*btn.w;
            }else
            {
                btn.x=i*btn.w;
            }
        }
        else
        {
            btn.x=i*btn.w;
        }
    }
}

-(void)setupCenterBtnFrame
{
    CGSize btnSize=self.btnCenter.currentBackgroundImage.size;
    self.btnCenter.w=btnSize.width;
    self.btnCenter.h=btnSize.height;
    self.btnCenter.cx=self.w*0.5;
    self.btnCenter.cy=self.h*0.5;
}

-(void)addTabBarButton:(UITabBarItem *)item
{
    CustomTabBarButton *btn=[[CustomTabBarButton alloc]init];
    btn.item=item;
    
    [self addSubview:btn];
    [self.arrBtns addObject:btn];
    
    [btn addTarget:self action:@selector(btnOther_Click:) forControlEvents:UIControlEventTouchDown];
    
    //必须在这设置选中
    if(self.arrBtns.count==1)
    {
        [self btnOther_Click:btn];
    }
}

-(void)CustomCenterButton:(NSString *)title BackgroundImg:(NSString *)bgimg ButtonImg:(NSString *)btnimg
{
    UIButton *btnCenter=[[UIButton alloc]init];
    [btnCenter setBackgroundImage:[UIImage imageNamed:bgimg] forState:UIControlStateNormal];
    [btnCenter setImage:[UIImage imageNamed:btnimg] forState:UIControlStateNormal];
    [btnCenter setTitle:title forState:UIControlStateNormal];
    btnCenter.titleLabel.font=[UIFont systemFontOfSize:12];
    self.btnCenter=btnCenter;
    [btnCenter addTarget:self action:@selector(btnCenterClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnCenter];
}

-(void)btnCenterClick:(UIButton*)sender
{
    if([self.delegate respondsToSelector:@selector(Basetab:clickCenterBtn:)])
    {
        [self.delegate Basetab:self clickCenterBtn:sender];
    }
}

-(void)btnOther_Click:(CustomTabBarButton*)btn
{
    if([self.delegate respondsToSelector:@selector(BaseTab:selectButtonTagFrom:selectButtonTagTo:)])
    {
        [self.delegate BaseTab:self selectButtonTagFrom:self.btnSelNow.tag selectButtonTagTo:btn.tag];
    }
    self.btnSelNow.selected=NO;
    btn.selected=YES;
    self.btnSelNow=btn;
}
@end
