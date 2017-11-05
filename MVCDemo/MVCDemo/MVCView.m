//
//  MVCView.m
//  MVCDemo
//
//  Created by lyons on 2017/11/5.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "MVCView.h"

@interface MVCView ()
@property (nonatomic,strong) UIButton *printBtn;

@end

@implementation MVCView
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.printBtn = [UIButton new];
        [self addSubview:_printBtn];
        _printBtn.frame = CGRectMake(100, 100, 100, 50);
        [_printBtn setTitle:@"print" forState:UIControlStateNormal];
        [_printBtn addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)printOnView:(MVCPaper*)paper
{
    NSLog(@"print paper content : %@",paper.content);
}


- (void)onPrintClick
{
    if (_delegate) {
        [_delegate onPrintBtnClick];
    }
    
}
@end
