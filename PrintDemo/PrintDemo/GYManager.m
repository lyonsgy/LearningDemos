//
//  GYManager.m
//  PrintDemo
//
//  Created by lyons on 2017/11/4.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "GYManager.h"
//#import "GYEmployee.h"
#import "GYPrintNotification.h"

@interface GYManager()
@end
@implementation GYManager
+ (instancetype)sharedInstance
{
    static GYManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [GYManager new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//***   3.通过通知的方法
//***   监听通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(celebratePrintDone) name:Notif_PrintTaskDone object:nil];
    
    }
    return self;
}

- (void)celebratePrintDone
{
    NSLog(@"Celebrate Print Done");
    
    
}


- (void)beginPrintTask
{
//***   1.互相引用的方法
//    [[GYEmployee sharedInstance] doPrintJob];
    
//***   2.通过delegat的方法
//    [GYEmployee sharedInstance].delegate = self;
    
//***   3.通过通知的方法
//***   通知了外界这个打印任务
    [[NSNotificationCenter defaultCenter] postNotificationName:Notif_BeginPrintTask object:nil];
}


//***   2.通过delegat的方法
//-(void)printJobDone{
//    //GYEmployee delegate
//    NSLog(@"Print Job Done");
//}


@end
