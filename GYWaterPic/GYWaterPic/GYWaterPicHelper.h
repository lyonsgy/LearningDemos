//
//  GYWaterPicHelper.h
//  GYWaterPic
//
//  Created by lyons on 2018/5/22.
//  Copyright © 2018年 lyons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface GYWaterPicHelper : NSObject
+ (void)addWaterPicWithVideoPath:(NSString*)path;

+ (void)applyVideoEffectsToComposition:(AVMutableVideoComposition *)composition size:(CGSize)size text:(NSString *)text;

@end
