//
//  ViewController.m
//  GYTimer
//
//  Created by lyons on 2018/3/22.
//  Copyright © 2018年 lyons. All rights reserved.
//

#import "ViewController.h"
#import "GYTimer.h"

@interface ViewController ()
@property (nonatomic ,strong) GYTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer = [[GYTimer alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  这里开始后滑动TextView，不会影响定时器
 *  退到后台定时器也不会暂停
 *
 */
- (IBAction)startBtnClick:(id)sender {
    __weak typeof(self) weakSelf = self;
    [_timer start:^(NSInteger timeCount) {
        NSInteger hours = timeCount/3600;
        NSInteger minutes = (timeCount - (3600*hours)) / 60;
        NSInteger seconds = timeCount%60;
        NSString *strTime = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld",(long)hours,(long)minutes,(long)seconds];
        weakSelf.timeLabel.text = strTime;
    }];
}

- (IBAction)pauseBtnClcik:(id)sender {
    [_timer pause];
    
}

- (IBAction)stopBtnClcik:(id)sender {
    [_timer stop];
    _timeLabel.text = @"00:00:00";
}
@end
