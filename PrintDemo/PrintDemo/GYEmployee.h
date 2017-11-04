//
//  GYEmployee.h
//  PrintDemo
//
//  Created by lyons on 2017/11/4.
//  Copyright © 2017年 GY. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol EmployeePrintDelegate <NSObject>

- (void)printJobDone;

@end


@interface GYEmployee : NSObject
+ (instancetype)sharedInstance;

- (void)doPrintJob;


@property (nonatomic, weak) id<EmployeePrintDelegate>   delegate;
@end
