//
//  GYEmployee.m
//  PrintDemo
//
//  Created by lyons on 2017/11/4.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "GYEmployee.h"
//#import "GYManager.h"
#import "GYPrintNotification.h"


@implementation GYEmployee
+ (instancetype)sharedInstance
{
    static GYEmployee *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [GYEmployee new];
    });
    return instance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
//***   3.通过通知的方法
//***   监听通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doPrintJob) name:Notif_BeginPrintTask object:nil];
    }
    return self;
}

- (void)doPrintJob
{
    NSLog(@"Do Printing Job!");
//***   1.互相引用的方法
//    [[GYManager sharedInstance] celebratePrintDone];
    
//***   2.通过delegat的方法
//    if (_delegate) {
//        [_delegate printJobDone];
//    }
    
//***   3.通过通知的方法
//***   告诉外界完成了任务
    [[NSNotificationCenter defaultCenter] postNotificationName:Notif_PrintTaskDone object:nil];
    
}
@end
