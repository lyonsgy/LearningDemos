//
//  GYView.h
//  MVPDemo
//
//  Created by lyons on 2017/11/12.
//  Copyright © 2017年 GY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GYViewDelegate <NSObject>

- (void)opPrintBtnClick;

@end


@interface GYView : UIView
@property(nonatomic ,weak) id<GYViewDelegate> delegate;

- (void)printOnView:(NSString *)content;
@end
