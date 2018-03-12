//
//  LPZRequest.m
//  MYProject
//
//  Created by lyons on 2018/3/8.
//  Copyright © 2018年 GY. All rights reserved.
//

#import "LPZRequest.h"

@implementation LPZRequest
+ (instancetype)request {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operationManager = [AFHTTPSessionManager manager];
    }
    return self;
}

- (void)request:(NSString *)URLString
  requestMethod:(LPZRequestMethod)requestMethod
     parameters:(NSDictionary*)parameters
       callBack:(void (^)(LPZRequest *request, NSString *responseString, NSError *error))callBack
{
    switch (requestMethod) {
        case LPZRequestMethodGET:
        {
        }
            break;
        case LPZRequestMethodPOST:
        {
            
        }
            break;
        case LPZRequestMethodPUT:
        {
            
        }
            break;
        case LPZRequestMethodDELETE:
        {
            
        }
            break;
        default:
            break;
    }
//    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:@"PUT" URLString:URLString parameters:parameters uploadProgress:nil downloadProgress:nil success:success failure:failure];
//
//    [dataTask resume];
    
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary*)parameters
   callBack:(void (^)(LPZRequest *request, NSString *responseString, NSError *error))callBack
{
    self.operationQueue=self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [self.operationManager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        callBack(self,nil,error);
    }];
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
    callBack:(void (^)(LPZRequest *request, NSString *responseString, NSError *error))callBack
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [self.operationManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString* responseJson = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        callBack(self,nil,error);
    }];
}

- (void)PUT:(NSString *)URLString
 parameters:(NSDictionary*)parameters
   callBack:(void (^)(LPZRequest *request, NSString *responseString, NSError *error))callBack
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [self.operationManager PUT:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString* responseJson = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        callBack(self,nil,error);
        
    }];
}

- (void)DELETE:(NSString *)URLString
    parameters:(NSDictionary*)parameters
      callBack:(void (^)(LPZRequest *request, NSString *responseString, NSError *error))callBack
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [self.operationManager DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString* responseJson = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        callBack(self,responseJson,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        callBack(self,nil,error);
        
    }];
}

- (void)cancelAllOperations{
    [self.operationQueue cancelAllOperations];
}
@end
