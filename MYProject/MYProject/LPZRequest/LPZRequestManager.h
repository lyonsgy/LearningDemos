//
//  LPZRequestManager.h
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

@interface LPZRequestManager : NSObject
/**
 *[AFNetWorking]的operationManager对象
 */
@property (nonatomic, strong ,nonnull) AFHTTPSessionManager * operationManager;

/**
 *当前的请求operation队列
 */
@property (nonatomic, strong ,nonnull) NSOperationQueue* operationQueue;

+ (instancetype _Nullable )request;


/**
 普通请求

 @param URLString 请求的url
 @param requestMethods 请求类型
 @param parameters 请求体参数
 @param downloadProgress 下载进度
 @param callBack 请求返回体
 */
- (void)request:(NSString *_Nullable)URLString
  requestMethod:(LPZRequestMethod)requestMethods
     parameters:(NSDictionary*_Nullable)parameters
       progress:(void (^_Nullable)(NSProgress * _Nullable progess))downloadProgress
       callBack:(void (^_Nullable)(LPZRequestManager * _Nullable request, NSString * _Nullable responseString, NSError * _Nonnull error))callBack;

/**
 GET请求

 @param URLString 请求的url
 @param parameters GET请求体参数
 @param callBack 请求返回体
 */
- (void)GET:(NSString *_Nullable)URLString
 parameters:(NSDictionary *_Nonnull)parameters
   callBack:(void (^_Nonnull)(LPZRequestManager * _Nonnull request, NSString * _Nonnull responseString, NSError * _Nullable error))callBack;

/**
 POST请求

 @param URLString 请求的url
 @param parameters POST请求体参数
 @param callBack 请求返回体
 */
- (void)POST:(NSString *_Nullable)URLString
  parameters:(NSDictionary *_Nonnull)parameters
    callBack:(void (^_Nonnull)(LPZRequestManager * _Nonnull request, NSString * _Nonnull responseString, NSError * _Nullable error))callBack;

/**
 PUT请求

 @param URLString 请求的url
 @param parameters PUT请求体参数
 @param callBack 请求返回体
 */
- (void)PUT:(NSString *_Nullable)URLString
 parameters:(NSDictionary *_Nonnull)parameters
   callBack:(void (^_Nonnull)(LPZRequestManager * _Nonnull request, NSString * _Nonnull responseString, NSError * _Nullable error))callBack;

/**
 DELETE请求

 @param URLString 请求的url
 @param parameters DELETE请求体参数
 @param callBack 请求返回体
 */
- (void)DELETE:(NSString *_Nullable)URLString
    parameters:(NSDictionary *_Nonnull)parameters
      callBack:(void (^_Nonnull)(LPZRequestManager * _Nonnull request, NSString * _Nonnull responseString, NSError * _Nullable error))callBack;


/**
 *取消当前请求队列的所有请求
 */
- (void)cancelAllOperations;

@end
