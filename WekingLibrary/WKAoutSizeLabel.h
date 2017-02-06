//
//  WKAoutSizeLabel.h
//  YaBuLi
//
//  Created by 周智伟 on 15/10/26.
//  Copyright © 2015年 yudd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKAoutSizeLabel : UILabel

@property(nonatomic,assign)CGSize MaxSize;

/**
 *  计算字符串Size
 *
 *  @param str   字符串
 *  @param fount 字体
 *  @param size  最大Size   0不限制最大最
 *
 *  @return 返回字符串所需最小Size
 */
+(CGSize)sizeWithString:(NSString *)str fount:(UIFont*)fount maxSize:(CGSize)size;
@end
