//
//  HTTPManager.h
//  weking
//
//  Created by 周智伟 on 16/6/6.
//  Copyright © 2016年 weking. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  请求管理类
 */
@interface WKHTTPManager : NSObject

/**
 *  正常上传服务器
 *
 *  @param url             尾部拼接url
 *  @param baseURL         基础url
 *  @param parameters      上传参数
 *  @param timeoutInterval 超时时间
 *  @param ismbp           是否有转圈提示
 *  @param block           正确返回
 *  @param errorBlock      错误返回（包括 超时和服务器异常）
 */
+(void)publickAtUrl:(NSString*)url
            BaseURL:(NSString *)baseURL
         parameters:(NSDictionary*)parameters
    timeoutInterval:(NSInteger)timeoutInterval
      mbprogresshud:(BOOL)ismbp
              block:(void(^)(id responseObject))block
   errorReturnBlock:(void(^)())errorBlock;


/**
 *  有图片的上传服务器
 *
 *  @param url        尾部拼接url
 *  @param baseURL    基础url
 *  @param parameters 上传参数
 *  @param imageArray 图片数组（可以传一张）
 *  @param isHud      是否有转圈提示
 *  @param block      正确返回
 *  @param block      错误返回
 */
+(void)publickHaveImageWithUrl:(NSString *)url
                       BaseURL:(NSString *)baseURL
                    parameters:(NSDictionary *)parameters
                    imageArray:(NSArray <UIImage *>*)imageArray
                         isHud:(BOOL)isHud
                         block:(void(^)(id responseObject))block
                        errorReturnBlock:(void(^)())errorBlock;
@end
