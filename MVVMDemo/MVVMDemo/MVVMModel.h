//
//  MVVMModel.h
//  MVVMDemo
//
//  Created by lyons on 2017/11/19.
//  Copyright © 2017年 GY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMPaper.h"

@interface MVVMModel : NSObject
@property (nonatomic ,strong) NSString *contentString;

- (void)setWithModel:(MVVMPaper*)paper;
- (void)onPrintClick;
@end
