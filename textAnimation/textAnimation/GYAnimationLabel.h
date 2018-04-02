//
//  GYAnimationLabel.h
//  textAnimation
//
//  Created by lyons on 2018/3/28.
//  Copyright © 2018年 lyons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GYAnimationLabel : UILabel

@property (nonatomic ,strong) NSTextStorage *textStorage;
@property (nonatomic ,strong) NSLayoutManager *textLayoutManager;
@property (nonatomic ,strong) NSTextContainer *textContainer;
@property (nonatomic ,strong) NSMutableArray<CATextLayer *> *oldCharacterTextLayers;
@property (nonatomic ,strong) NSMutableArray<CATextLayer *> *characterTextLayers;

@end
