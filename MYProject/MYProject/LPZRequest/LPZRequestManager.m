//
//  LPZRequestManager.m
//  MYProject
//
//  Created by lyons on 2018/3/8.
//  Copyright © 2018年 GY. All rights reserved.
//

#import "LPZRequestManager.h"

@implementation LPZRequestManager

+ (instancetype)request {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operationManager = [AFHTTPSessionManager manager];
        [self.operationManager.requestSerializer setValue:@"" forHTTPHeaderField:@"token"];//TODO:
        
    }
    return self;
}

- (void)request:(NSString *)URLString
  requestMethod:(LPZRequestMethod)requestMethods
     parameters:(NSDictionary*)parameters
       progress:(void (^)(NSProgress *progess))downloadProgress
       callBack:(void (^)(LPZRequestManager *request, NSString *responseString, NSError *error))callBack
{
    [self request:URLString requestMethod:requestMethods parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask *task, id responseObject) {

        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        callBack(self,nil,error);

    }];
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary*)parameters
   callBack:(void (^)(LPZRequestManager *request, NSString *responseString, NSError *error))callBack
{
    self.operationQueue=self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];


    [self.operationManager GET:URLString parameters:parameters progress:^(NSProgress *downloadProgress) {

    } success:^(NSURLSessionDataTask *task, id responseObject) {

        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        callBack(self,nil,error);
    }];
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
    callBack:(void (^)(LPZRequestManager *request, NSString *responseString, NSError *error))callBack
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [self.operationManager POST:URLString parameters:parameters progress:^(NSProgress *uploadProgress) {

    } success:^(NSURLSessionDataTask *task, id responseObject) {

        NSString* responseJson = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        callBack(self,nil,error);
    }];
}

- (void)PUT:(NSString *)URLString
 parameters:(NSDictionary*)parameters
   callBack:(void (^)(LPZRequestManager *request, NSString *responseString, NSError *error))callBack
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [self.operationManager PUT:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {

        NSString* responseJson = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        callBack(self,nil,error);

    }];
}

- (void)DELETE:(NSString *)URLString
    parameters:(NSDictionary*)parameters
      callBack:(void (^)(LPZRequestManager *request, NSString *responseString, NSError *error))callBack
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [self.operationManager DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {

        NSString* responseJson = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        callBack(self,nil,error);

    }];
}

- (void)request:(NSString *)URLString
  requestMethod:(LPZRequestMethod)requestMethods
     parameters:(NSDictionary*)parameters
       progress:(void (^)(NSProgress *progress))downloadProgress
        success:(void (^)(NSURLSessionDataTask *task, id  responseObject))success
        failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    switch (requestMethods) {
        case LPZRequestMethodGET:
        {
            [self.operationManager GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
        }
            break;
        case LPZRequestMethodPOST:
        {
            [self.operationManager POST:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
        }
            break;
        case LPZRequestMethodPUT:
        {
            [self.operationManager PUT:URLString parameters:parameters success:success failure:failure];
        }
            break;
        case LPZRequestMethodDELETE:
        {
            [self.operationManager DELETE:URLString parameters:parameters success:success failure:failure];
        }
            break;
        default:
            break;
    }
}

- (void)cancelAllOperations{
    [self.operationQueue cancelAllOperations];
}
@end
