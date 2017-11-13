//
//  GYPresenter.h
//  MVPDemo
//
//  Created by lyons on 2017/11/12.
//  Copyright © 2017年 GY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GYView.h"
#import "GYModel.h"

@interface GYPresenter : NSObject
@property(nonatomic, strong) GYView *view;
@property(nonatomic, strong) GYModel *model;


- (void)printTask;
@end
