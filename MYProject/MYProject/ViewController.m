//
//  ViewController.m
//  MYProject
//
//  Created by lyons on 2018/3/8.
//  Copyright © 2018年 GY. All rights reserved.
//

#import "ViewController.h"
#import "LPZRequest.h"

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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
