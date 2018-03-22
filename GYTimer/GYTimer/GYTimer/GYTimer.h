//
//  GYTimer.h
//  GCD CountTDemo
//
//  Created by 郭阳 on 2017/1/14.
//  Copyright © 2017年 gq. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 返回block

 @param timeCount 返回秒数
 */
typedef void (^GYTimerBlock)(NSInteger timeCount);

@interface GYTimer : NSObject

/**
 秒数
 */
@property (nonatomic,assign) NSInteger timeCount;


/**
 定时器开始

 @param block 返回秒数
 */
- (void)start:(GYTimerBlock)block;

/**
 暂停
 */
- (void)pause;

/**
 停止并销毁timer
 */
- (void)stop;

@end
