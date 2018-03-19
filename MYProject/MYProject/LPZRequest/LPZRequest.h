//
//  LPZRequest.h
//  MYProject
//
//  Created by lyons on 2018/3/8.
//  Copyright © 2018年 GY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef NS_ENUM(NSUInteger, LPZRequestMethod) {
    LPZRequestMethodGET=0,
    LPZRequestMethodPOST,
    LPZRequestMethodPUT,
    LPZRequestMethodDELETE
};

@interface LPZRequest : NSObject
/**
 *[AFNetWorking]的operationManager对象
 */
@property (nonatomic, strong) AFHTTPSessionManager * operationManager;

/**
 *当前的请求operation队列
 */
@property (nonatomic, strong) NSOperationQueue* operationQueue;

+ (instancetype)request;


/**
 普通请求
 
 @param URLString 请求的url
 @param requestMethod 请求类型
 @param parameters 请求体参数
 @param downloadProgress 下载进度
 @param callBack 请求返回体
 */
- (void)request:(NSString *)URLString
  requestMethod:(LPZRequestMethod)requestMethods
     parameters:(NSDictionary*)parameters
       progress:(void (^)(NSProgress *progess))downloadProgress
       callBack:(void (^)(LPZRequest * _Nullable request, NSString * _Nullable responseString, NSError * _Nonnull error))callBack;

/**
 GET请求
 
 @param URLString 请求的url
 @param parameters GET请求体参数
 @param callBack 请求返回体
 */
- (void)GET:(NSString *)URLString
 parameters:(NSDictionary*)parameters
   callBack:(void (^_Nonnull)(LPZRequest * _Nonnull request, NSString * _Nonnull responseString, NSError * _Nullable error))callBack;

/**
 POST请求
 
 @param URLString 请求的url
 @param parameters POST请求体参数
 @param callBack 请求返回体
 */
- (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
    callBack:(void (^)(LPZRequest *request, NSString *responseString, NSError *error))callBack;

/**
 PUT请求
 
 @param URLString 请求的url
 @param parameters PUT请求体参数
 @param callBack 请求返回体
 */
- (void)PUT:(NSString *)URLString
 parameters:(NSDictionary*)parameters
   callBack:(void (^)(LPZRequest *request, NSString *responseString, NSError *error))callBack;

/**
 DELETE请求
 
 @param URLString 请求的url
 @param parameters DELETE请求体参数
 @param callBack 请求返回体
 */
- (void)DELETE:(NSString *)URLString
    parameters:(NSDictionary*)parameters
      callBack:(void (^)(LPZRequest *request, NSString *responseString, NSError *error))callBack;


/**
 *取消当前请求队列的所有请求
 */
- (void)cancelAllOperations;

@end
