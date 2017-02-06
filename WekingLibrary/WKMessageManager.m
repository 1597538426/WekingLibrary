//
//  WKMessageManager.m
//  ChiDaoTV
//
//  Created by 周智伟 on 16/8/11.
//  Copyright © 2016年 weking. All rights reserved.
//

#import "WKMessageManager.h"
#import <UIKit/UIKit.h>
#import "UIView+RadiusBorder.h"
#import "WKAoutSizeLabel.h"

#define kScreenFrame                    [UIScreen mainScreen].bounds
#define kScreenSize                     kScreenFrame.size
#define kScreenWidth                    kScreenFrame.size.width
#define kScreenHeight                   kScreenFrame.size.height

@interface WKMessageManager ()
@property(nonatomic,strong)UILabel * messageLabel;
@end
@implementation WKMessageManager
+ (WKMessageManager *)sharedManager
{
    static WKMessageManager *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

-(UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
        _messageLabel.font = [UIFont boldSystemFontOfSize:16];
        _messageLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [_messageLabel setCornerRadius:10];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.textColor = [UIColor whiteColor];
    }
    return _messageLabel;
}

-(void)showMessage:(NSString *)message style:(WKMessageType)style
{

    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window addSubview:self.messageLabel];
    
    _messageLabel.text = message;
    CGSize maxSize = CGSizeMake(kScreenWidth - 40, 18);
    CGSize size = [WKAoutSizeLabel sizeWithString:message fount:[UIFont boldSystemFontOfSize:16] maxSize:maxSize];
    _messageLabel.widthCl = size.width + 20;
    
    switch (style) {
        case WKMessageTypeFromBottomToCenter:
        {
            _messageLabel.alpha = 1;
            _messageLabel.center = CGPointMake(kScreenWidth/2, kScreenHeight);
            
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
                _messageLabel.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
            } completion:^(BOOL finished) {
                
            }];
            
            [UIView animateWithDuration:0.3 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
                _messageLabel.alpha = 0;
            } completion:^(BOOL finished) {
                [_messageLabel removeFromSuperview];
            }];

        }
            break;
        case WKMessageTypeGraduallyShowInCenter:
        {
            _messageLabel.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
            _messageLabel.alpha = 1;
            [UIView animateWithDuration:0.3 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
                _messageLabel.alpha = 0;
            } completion:^(BOOL finished) {
                [_messageLabel removeFromSuperview];
            }];
        }
            break;
        default:
            break;
    }
}
@end
