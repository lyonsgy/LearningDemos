//
//  MVVMView.m
//  MVVMDemo
//
//  Created by lyons on 2017/11/19.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "MVVMView.h"
#import "FBKVOController.h"
#import "NSObject+FBKVOController.h"

@interface MVVMView()
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UIButton *printBtn;
@property (nonatomic ,strong) MVVMModel *vm;
@end

@implementation MVVMView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contentLabel = [UILabel new];
        [self addSubview:_contentLabel];
        _contentLabel.frame = CGRectMake(100, 100, 100, 30);
        _contentLabel.font = [UIFont systemFontOfSize:20];
        _contentLabel.textColor = [UIColor blackColor];
        
        self.printBtn = [UIButton new];
        [self addSubview:_printBtn];
        _printBtn.frame = CGRectMake(100, 200, 100, 50);
        [_printBtn setTitle:@"print" forState:UIControlStateNormal];
        [_printBtn addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)setWithViewModel:(MVVMModel*)vm
{
    self.vm = vm;
    [self.KVOController observe:vm keyPath:@"contentString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        
        NSString *newContent = change[NSKeyValueChangeNewKey];
        _contentLabel.text = newContent;
        
    }];
}

- (void)onPrintClick
{
    [_vm onPrintClick];
    
}



@end
