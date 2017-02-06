//
//  HTTPManager.m
//  weking
//
//  Created by 周智伟 on 16/6/6.
//  Copyright © 2016年 weking. All rights reserved.
//

#import "WKHTTPManager.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "NSString+Extension.h"
#import "WKMessageManager.h"



/**
 *  屏幕当前window
 *
 */
#define  DEF_WINDOW  (UIwindow*)[[[[UIApplication sharedApplication] windows] lastObject]

//提示框
#define alertContent(content) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" \
message:content \
delegate:nil   \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil];  \
[alert show];

@implementation WKHTTPManager

#pragma mark- 公有
+(void)publickAtUrl:(NSString*)url
            BaseURL:(NSString *)baseURL
         parameters:(NSDictionary*)parameters
    timeoutInterval:(NSInteger)timeoutInterval
    mbprogresshud:(BOOL)ismbp
              block:(void(^)(id responseObject))block
errorReturnBlock:(void(^)())errorBlock{

    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD * hud = ismbp?[[MBProgressHUD alloc]initWithWindow:window]:nil;
    [hud show:YES];
    [window addSubview:hud];
    hud.labelText = @"正在加载...";
    hud.removeFromSuperViewOnHide = YES;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:baseURL]];
    manager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    
    //将字典转成json传给后台
    NSString * jsonStr = [NSString dictionaryToJson:parameters];
    NSDictionary * dic = @{@"request":jsonStr};
    
    [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [hud hide:YES afterDelay:0];
    
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //操作成功 的判断
        if ([[resultDic objectForKey:@"success"] boolValue]) {
            //成功之返回数据信息
            block([resultDic objectForKey:@"result"]);
        }else{
            alertContent([resultDic objectForKey:@"message"]);
            NSLog(@"%@",url);
            //返回错误时 将信息全部返回
            if (errorBlock) {
                errorBlock();
            }

        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [hud hide:YES afterDelay:0];
        //网络错误时 只返回字符串

        [[WKMessageManager sharedManager]showMessage:@"网络有点卡" style:0];
        //返回错误时 将信息全部返回
        if (errorBlock) {
            errorBlock();
        }
      
    }];
}
#pragma mark --- 带有图片的上传
+(void)publickHaveImageWithUrl:(NSString *)url
                       BaseURL:(NSString *)baseURL
                    parameters:(NSDictionary *)parameters
                         imageArray:(NSArray <UIImage *>*)imageArray
                         isHud:(BOOL)isHud
                         block:(void(^)(id responseObject))block
                            errorReturnBlock:(void(^)())errorBlock{
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD * hud = isHud?[[MBProgressHUD alloc]initWithWindow:window]:nil;
    [hud show:YES];
    [window addSubview:hud];
    
    hud.labelText = @"正在加载...";
    hud.removeFromSuperViewOnHide = YES;
    
    NSString * str = [NSString stringWithFormat:@"%@%@",baseURL,url];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:baseURL]];
    manager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    
    NSString * jsonStr = [NSString dictionaryToJson:parameters];
    NSDictionary * dic = @{@"request":jsonStr};
    
    [manager POST:str parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i < imageArray.count; i ++) {
            UIImage * image = imageArray[i];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
            
            NSString * name = [NSString stringWithFormat:@"image%d",i];
            [formData appendPartWithFileData:UIImageJPEGRepresentation(image,1) name:name fileName:[NSString jsonUtils:fileName] mimeType:@"image/jpeg"];
        }
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [hud hide:YES afterDelay:0];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //操作成功 的判断
        if ([[resultDic objectForKey:@"success"] boolValue]) {
            //成功之返回数据信息
            block([resultDic objectForKey:@"result"]);
        }else{
            alertContent([resultDic objectForKey:@"message"]);
            if (errorBlock) {
                errorBlock();
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [hud hide:YES afterDelay:0];
        [[WKMessageManager sharedManager]showMessage:@"网络有点卡" style:0];
        //返回错误时 将信息全部返回
        if (errorBlock) {
            errorBlock();
        }
    }];
    
}
//#pragma mark-- 公用简化 不带错误block 菊花自定
//+(void)publickSimplifyWithUrl:(NSString*)url
//                  parameters:(NSDictionary*)parameters
//                       isHud:(BOOL)isHud
//                       block:(void(^)(id responseObject))block
//{
//    [HTTPManager publickAtUrl:url parameters:parameters timeoutInterval:15 mbprogresshud:isHud block:block errorReturnBlock:nil];
//}
//
//#pragma mark 公用简化 带错误block 菊花自定
//+(void)publickHaveErrorBlockWithUrl:(NSString*)url
//                       parameters:(NSDictionary*)parameters
//                        isHud:(BOOL)isHud
//                            block:(void(^)(id responseObject))block
//                         errorBlock:(void(^)())errorBlock
//{
//
//    [HTTPManager publickAtUrl:url parameters:parameters timeoutInterval:15 mbprogresshud:isHud  block:block errorReturnBlock:errorBlock];
//}

@end
