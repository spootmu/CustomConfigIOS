//
//  UIView+Extension.m
//  新浪微博
//
//  Created by apple on 15/8/13.
//  Copyright (c) 2015年 spoot. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}
-(CGFloat)w
{
    return self.frame.size.width;
}
-(CGFloat)h
{
    return self.frame.size.height;
}
-(CGFloat)cx
{
    return self.center.x;
}
-(CGFloat)cy
{
    return self.center.y;
}

-(void)setX:(CGFloat)x{
    CGRect tempFrame=self.frame;
    tempFrame.origin.x=x;
    self.frame=tempFrame;
}

-(void)setY:(CGFloat)y{
    CGRect tempFrame=self.frame;
    tempFrame.origin.y=y;
    self.frame=tempFrame;
}

-(void)setW:(CGFloat)w{
    CGRect tempFrame=self.frame;
    tempFrame.size.width=w;
    self.frame=tempFrame;
}

-(void)setH:(CGFloat)h{
    CGRect tempFrame=self.frame;
    tempFrame.size.height=h;
    self.frame=tempFrame;
}

-(void)setCx:(CGFloat)cx{
    CGPoint tempCenter=self.center;
    tempCenter.x=cx;
    self.center=tempCenter;
}

-(void)setCy:(CGFloat)cy{
    CGPoint tempCenter=self.center;
    tempCenter.y=cy;
    self.center=tempCenter;
}

-(void)setSize:(CGSize)size
{
    CGRect frame=self.frame;
    frame.size=size;
    self.frame=frame;
}
-(CGSize)size{
    return self.frame.size;
}
@end
