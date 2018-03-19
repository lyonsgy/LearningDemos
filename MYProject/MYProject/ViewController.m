//
//  ViewController.m
//  MYProject
//
//  Created by lyons on 2018/3/8.
//  Copyright © 2018年 GY. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "LPZRequestManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [UIView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).with.offset(0);
    }];
    
    
    [[LPZRequestManager request] GET:@"" parameters:@{} callBack:^(LPZRequestManager * _Nonnull request, NSString * _Nonnull responseString, NSError * _Nullable error) {
        
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
