//
//  MVVMViewController.m
//  MVVMDemo
//
//  Created by lyons on 2017/11/19.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMPaper.h"
#import "MVVMView.h"
#import "MVVMModel.h"

@interface MVVMViewController ()
@property (nonatomic, strong) MVVMPaper *paper;
@property (nonatomic, strong) MVVMView  *mvvmView;
@property (nonatomic, strong) MVVMModel *model;

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.paper = [MVVMPaper new];
    _paper.content = @"LINE 0";
    self.model = [MVVMModel new];
    
    self.mvvmView = [MVVMView new];
    _mvvmView.frame = self.view.bounds;
    [self.view addSubview:_mvvmView];
    
    //注意 paper 先 model 后
    [_model setWithModel:_paper];
    [_mvvmView setWithViewModel:_model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
