//
//  MVCView.h
//  MVCDemo
//
//  Created by lyons on 2017/11/5.
//  Copyright © 2017年 GY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCPaper.h"

@protocol MVCViewDelegate <NSObject>

- (void)onPrintBtnClick;

@end
@interface MVCView : UIView

- (void)printOnView:(MVCPaper*)paper;

@property (nonatomic,weak) id<MVCViewDelegate> delegate;

@end
