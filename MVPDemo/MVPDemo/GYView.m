//
//  GYView.m
//  MVPDemo
//
//  Created by lyons on 2017/11/12.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "GYView.h"

@interface GYView ()
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *printBtn;

@end


@implementation GYView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.contentLabel = [UILabel new];
        [self addSubview:_contentLabel];
        _contentLabel.frame = CGRectMake(0, 100, 300, 30);
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor blackColor];
        
        self.printBtn = [UIButton new];
        [self addSubview:_printBtn];
        _printBtn.frame = CGRectMake(100, 200, 100, 50);
        [_printBtn setTitle:@"print" forState:UIControlStateNormal];
        [_printBtn addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)printOnView:(NSString *)content
{
    _contentLabel.text = content;
}

-(void)onPrintClick
{
    if (_delegate) {
        [_delegate opPrintBtnClick];
    }
}
@end
