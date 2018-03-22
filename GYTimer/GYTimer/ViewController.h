//
//  ViewController.h
//  GYTimer
//
//  Created by lyons on 2018/3/22.
//  Copyright © 2018年 lyons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;

- (IBAction)startBtnClick:(id)sender;
- (IBAction)pauseBtnClcik:(id)sender;
- (IBAction)stopBtnClcik:(id)sender;

@end

