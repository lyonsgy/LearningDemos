//
//  MVPViewController.m
//  MVPDemo
//
//  Created by lyons on 2017/11/12.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "MVPViewController.h"
#import "GYPresenter.h"
#import "GYView.h"
#import "GYModel.h"

@interface MVPViewController ()
@property(nonatomic, strong) GYPresenter *presenter;
@property(nonatomic, strong) GYView *mvpView;
@property(nonatomic, strong) GYModel *mvpModel;

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.mvpView = [GYView new];
    _mvpView.frame = self.view.bounds;
    [self.view addSubview:_mvpView];
    
    self.mvpModel = [GYModel new];
    _mvpModel.content = @"line 0";
    self.presenter = [GYPresenter new];
    _presenter.view = _mvpView;
    _presenter.model = _mvpModel;
    
    _mvpView.delegate = _presenter;
    
    [_presenter printTask];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
