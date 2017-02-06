//
//  UIView+RadiusBorder.h
//
//
//  Created by yudandan on 15/10/9.
//  Copyright (c) 2015年 yudandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RadiusBorder)

/**
 *  圆角和边框
 */
-(void)radiusBorderWithRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor;

/**
 *  边框宽度  (可在nib使用)
 */
-(void)setBorderWidth:(CGFloat)borderWidth;
/**
 *  边框颜色  (可在nib使用)
 */
-(void)setBorderColor:(UIColor*)borderColor;
/**
 *  圆角  (可在nib使用)
 */
-(void)setCornerRadius:(CGFloat)cornerRadius;
/**
 *  圆形
 */
-(void)setCornerRadiusRound;

/**
 *  深度赋值宽
 *
 *  @param widthCl
 */
-(void)setWidthCl:(CGFloat)widthCl;
/**
 *  深度赋值高
 *
 *  @param widthCl
 */
-(void)setHeightCl:(CGFloat)heightCl;
/**
 *  深度赋值x
 *
 *  @param widthCl
 */
-(void)setXCl:(CGFloat)xCl;
/**
 *  深度赋值y
 *
 *  @param widthCl
 */
-(void)setYCl:(CGFloat)yCl;


/**
 *  深度辅助 底部坐标
 *
 *  @param bottomCL 
 */
-(void)setBottomCL:(CGFloat)bottomCL;


/**
 *  快速速取值width
 *
 *  @return
 */
-(CGFloat)widthCl;
/**
 *  快速速取值height
 *
 *  @return
 */
-(CGFloat)heightCl;
/**
 *  快速速取值x
 *
 *  @return
 */
-(CGFloat)xCl;
/**
 *  快速速取值y
 *
 *  @return
 */
-(CGFloat)yCl;
/**
 *  快速速取值top
 *
 *  @return
 */
-(CGFloat)topCL;
/**
 *  快速速取值left
 *
 *  @return
 */
-(CGFloat)leftCL;
/**
 *  快速速取值right
 *
 *  @return
 */
-(CGFloat)rightCl;
/**
 *  快速速取值bottom
 *
 *  @return
 */
-(CGFloat)bottomCL;




@end
