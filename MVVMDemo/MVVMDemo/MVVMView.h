//
//  MVVMView.h
//  MVVMDemo
//
//  Created by lyons on 2017/11/19.
//  Copyright © 2017年 GY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMModel.h"

@interface MVVMView : UIView
- (void)setWithViewModel:(MVVMModel*)vm;

@end
