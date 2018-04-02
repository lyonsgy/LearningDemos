//
//  ViewController.m
//  textAnimation
//
//  Created by lyons on 2018/3/28.
//  Copyright © 2018年 lyons. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()
{
    NSMutableArray *labels;
    NSMutableArray *numArr;
    NSMutableArray *dataArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTextStorage *textStorage = [NSTextStorage new];
    
    NSLayoutManager *layoutManager = [NSLayoutManager new];
    [textStorage addLayoutManager: layoutManager];
    
    NSTextContainer *textContainer = [NSTextContainer new];
    [layoutManager addTextContainer: textContainer];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 400, 200, 200)
                                               textContainer:textContainer];
    [self.view addSubview:textView];
    
    
}

- (IBAction)buttonClick:(id)sender {
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    vi.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vi];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = vi.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [vi.layer addSublayer:textLayer];
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:16];
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        
        printf( "Family: %s \n", [familyName UTF8String] );
        
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
    
    NSString *str = @"还是月西江更有意境:日暮江水远,入夜随风迁,秋叶乱水月...";
    
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:str];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor whiteColor].CGColor,
                              (__bridge id)kCTFontAttributeName:(__bridge id)fontRef
                              };
    [string setAttributes:attribs range:NSMakeRange(0, str.length)];
    
    dataArr = [NSMutableArray arrayWithObjects:(__bridge id _Nonnull)(fontRef),attribs,string,str,textLayer, nil];
    numArr = [NSMutableArray array];
    for (int i = 0; i < str.length; i++) {
        [numArr addObject:[NSNumber numberWithInt:i]];
        NSInteger sum = arc4random() % 6;
        CGFloat x = (sum+1)*.1;
        [self performSelector:@selector(changeToBlack) withObject:nil afterDelay:x*i];
    }
    CFRelease(fontRef);
}

- (void)changeToBlack {
    CTFontRef fontRef = (__bridge CTFontRef)(dataArr[0]);
    NSMutableAttributedString *string = dataArr[2];
    NSNumber *num = [numArr firstObject];
    int y = [num intValue];
    NSDictionary *attribs = dataArr[1];
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,
                (__bridge id)kCTFontAttributeName:(__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(y, 1)];
    if (numArr.count > 1) {
        [numArr removeObjectAtIndex:0];
    }
    CATextLayer *textLayer = [dataArr lastObject];
    textLayer.string = string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
