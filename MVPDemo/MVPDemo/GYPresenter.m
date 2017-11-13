//
//  GYPresenter.m
//  MVPDemo
//
//  Created by lyons on 2017/11/12.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "GYPresenter.h"

@interface GYPresenter ()<GYViewDelegate>

@end

@implementation GYPresenter

-(void)printTask
{
    NSString *printContent = _model.content;
    [_view printOnView:printContent];

}

- (void)opPrintBtnClick
{
    int rand = arc4random()%10;
    _model.content = [NSString stringWithFormat:@"line %d",rand+1];
    [_view printOnView:_model.content];
}
@end
