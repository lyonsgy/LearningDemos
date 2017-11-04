//
//  GYManager.h
//  PrintDemo
//
//  Created by lyons on 2017/11/4.
//  Copyright © 2017年 GY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYManager : NSObject
+ (instancetype)sharedInstance;

- (void)celebratePrintDone;

- (void)beginPrintTask;

@end
