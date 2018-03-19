//
//  ViewController.m
//  MYProject
//
//  Created by lyons on 2018/3/8.
//  Copyright © 2018年 GY. All rights reserved.
//

#import "ViewController.h"
#import "LPZRequest.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[LPZRequest request] GET:@"" parameters:@{} callBack:^(LPZRequest *request, NSString *responseString, NSError *error) {
        if (!error) {
            
        }else{
            
        }
    }];
    
    [[LPZRequest request] request:@"" requestMethod:(LPZRequestMethodGET) parameters:@{} progress:^(NSProgress *progess) {
        
    } callBack:^(LPZRequest * _Nullable request, NSString * _Nullable responseString, NSError * _Nonnull error) {
        
    }];
    
    UIView *view = [UIView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).with.offset(0);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
