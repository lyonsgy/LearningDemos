//
//  GYAnimationLabel.m
//  textAnimation
//
//  Created by lyons on 2018/3/28.
//  Copyright © 2018年 lyons. All rights reserved.
//

#import "GYAnimationLabel.h"

@implementation GYAnimationLabel
- (void)setText:(NSString *)text
{
    super.text = text;
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]initWithString:text];
    NSRange textRange = NSMakeRange(0, text.length);
    
    [attributedText addAttribute:NSForegroundColorAttributeName
                value:self.textColor
                range:textRange];
    [attributedText addAttribute:NSFontAttributeName
                           value:self.font
                           range:textRange];
    NSMutableParagraphStyle *paragraphyStyle = [NSMutableParagraphStyle new];
    paragraphyStyle.alignment = self.textAlignment;
    
    [attributedText addAttribute:NSParagraphStyleAttributeName
                           value:paragraphyStyle
                           range:textRange];
    
    self.attributedText = attributedText;
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [_oldCharacterTextLayers removeAllObjects];
    _oldCharacterTextLayers = [NSMutableArray arrayWithArray:_characterTextLayers];
    [_textStorage setAttributedString:attributedText];
//    [self startAnimation];
//    self.endAnimation(nil)
}

- (void)setTextLayoutManager:(NSLayoutManager *)textLayoutManager
{
    
}
@end
