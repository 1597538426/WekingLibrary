//
//  WKMessageManager.h
//  ChiDaoTV
//
//  Created by 周智伟 on 16/8/11.
//  Copyright © 2016年 weking. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,WKMessageType){
    WKMessageTypeFromBottomToCenter, //从下到中间显示
    WKMessageTypeGraduallyShowInCenter,//在中间逐渐显示出来
    
};

@interface WKMessageManager : NSObject

/**
 *  初始化
 *
 *  @return
 */
+ (WKMessageManager *)sharedManager;
/**
 *  显示消息
 *
 *  @param message
 *  @param style
 */
-(void)showMessage:(NSString *)message style:(WKMessageType)style;
@end
