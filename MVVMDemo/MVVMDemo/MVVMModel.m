//
//  MVVMModel.m
//  MVVMDemo
//
//  Created by lyons on 2017/11/19.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "MVVMModel.h"
#import "FBKVOController.h"
@interface MVVMModel()
@property (nonatomic ,strong) MVVMPaper *paper;
@end

@implementation MVVMModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setWithModel:(MVVMPaper *)paper
{
    self.paper = paper;
    self.contentString = paper.content;
    
}

- (void)onPrintClick
{
    self.paper.content = @"LINE 1";
    self.contentString = self.paper.content;
    
}
@end
