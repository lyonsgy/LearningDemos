//
//  ViewController.m
//  PrintDemo
//
//  Created by lyons on 2017/11/4.
//  Copyright © 2017年 GY. All rights reserved.
//

#import "ViewController.h"
#import "GYManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[GYManager sharedInstance] beginPrintTask];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
