//
//  MVCViewController.m
//  MVCDemo
//
//  Created by lyons on 2017/11/5.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "MVCViewController.h"
#import "MVCView.h"
#import "MVCPaper.h"

@interface MVCViewController ()<MVCViewDelegate>
@property (nonatomic,strong)MVCView *myView;
@property (nonatomic,strong)MVCPaper *paper;
@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myView = [MVCView new];
    _myView.delegate = self;
    [self.view addSubview:_myView];
    _myView.frame = self.view.bounds;
    self.paper = [MVCPaper new];
    _paper.content = @"line 0";
    [self printPaper];
}

- (void)printPaper
{
    [self.myView printOnView:self.paper];
    
}

-(void)onPrintBtnClick
{
    int rand = arc4random()%10;
    _paper.content = [NSString stringWithFormat:@"line %d",rand+1];
    
    [_myView printOnView:_paper];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
