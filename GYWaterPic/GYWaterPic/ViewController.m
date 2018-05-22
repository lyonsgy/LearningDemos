//
//  ViewController.m
//  GYWaterPic
//
//  Created by lyons on 2018/5/22.
//  Copyright © 2018年 lyons. All rights reserved.
//

#import "ViewController.h"
#import "GYWaterPicHelper.h"
#import "TZImagePickerController.h"

@interface ViewController ()<TZImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)buttonClick:(id)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage, id asset) {
        PHAsset *videoAsset = asset;
        [GYWaterPicHelper getVideoPath:videoAsset resultHandler:^(AVURLAsset *urlAsset) {
            [GYWaterPicHelper addWaterPicWithVideoPath:urlAsset.URL.absoluteString];
        }];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
@end
