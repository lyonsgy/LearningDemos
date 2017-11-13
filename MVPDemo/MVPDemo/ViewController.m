//
//  ViewController.m
//  MVPDemo
//
//  Created by lyons on 2017/11/12.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "ViewController.h"
#import "MVPViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showMvp];
    });
}

- (void)showMvp
{
    MVPViewController *vc = [MVPViewController new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
