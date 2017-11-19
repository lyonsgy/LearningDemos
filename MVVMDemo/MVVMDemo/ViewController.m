//
//  ViewController.m
//  MVVMDemo
//
//  Created by lyons on 2017/11/14.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "ViewController.h"
#import "MVVMViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showMVVM];
    });
    
}

- (void)showMVVM
{
    MVVMViewController *vc = [MVVMViewController new];
    [self presentViewController:vc animated:true completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
