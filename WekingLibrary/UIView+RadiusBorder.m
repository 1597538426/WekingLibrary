//
//  UIView+RadiusBorder.m
//  
//
//  Created by yudandan on 15/10/9.
//  Copyright (c) 2015年 yudandan. All rights reserved.
//

#import "UIView+RadiusBorder.h"

@implementation UIView (RadiusBorder)

#pragma mark 圆角和边框
-(void)radiusBorderWithRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor{
    
    if (borderColor) {self.layer.borderColor=borderColor.CGColor;}
    if (borderWidth) {self.layer.borderWidth=borderWidth;}
    if (cornerRadius) {self.layer.cornerRadius=cornerRadius;}
    self.layer.masksToBounds=YES;
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth=borderWidth;
}
-(void)setBorderColor:(UIColor*)borderColor{
    self.layer.borderColor=borderColor.CGColor;
}
-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius=cornerRadius;
    self.layer.masksToBounds=YES;
}
-(void)setCornerRadiusRound{
    self.layer.cornerRadius=self.widthCl/2;
    self.layer.masksToBounds=YES;
}




#pragma mark- 深度赋值
-(void)setWidthCl:(CGFloat)widthCl{
    CGRect frame=self.frame;
    frame.size.width=widthCl;
    self.frame=frame;
}
-(void)setHeightCl:(CGFloat)heightCl{
    CGRect frame=self.frame;
    frame.size.height=heightCl;
    self.frame=frame;
}
-(void)setXCl:(CGFloat)xCl{
    CGRect frame=self.frame;
    frame.origin.x=xCl;
    self.frame=frame;
}
-(void)setYCl:(CGFloat)yCl{
    CGRect frame=self.frame;
    frame.origin.y=yCl;
    self.frame=frame;
}



#pragma mark- 优化快速取值
-(CGFloat)widthCl{
    if (self) {return self.frame.size.width;}
    return 0;
}
-(CGFloat)heightCl{
    if (self) {return self.frame.size.height;}
    return 0;
}
-(CGFloat)xCl{
    if (self) {return self.frame.origin.x;}
    return 0;
}
-(CGFloat)yCl{
    if (self) {return self.frame.origin.y;}
    return 0;
    
}

-(CGFloat)topCL{
    return [self yCl];
}

-(CGFloat)leftCL{
    return [self xCl];
}

-(CGFloat)rightCl{
    if (self) {return self.frame.origin.x+self.frame.size.width;}
    return 0;
}

-(CGFloat)bottomCL{
    if (self) { return self.frame.origin.y+self.frame.size.height;}
    return 0;
}

-(void)setBottomCL:(CGFloat)bottomCL{
    self.heightCl=bottomCL-self.frame.origin.y;
}

@end
