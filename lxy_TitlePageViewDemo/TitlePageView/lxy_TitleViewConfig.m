//
//  lxy_TitleViewConfig.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "lxy_TitleViewConfig.h"

@implementation lxy_TitleViewConfig
+ (lxy_TitleViewConfig *)defaultConfig{
    lxy_TitleViewConfig *defaultConfig = [[lxy_TitleViewConfig alloc] init];
    
    defaultConfig.isNormalSelect = YES;
    defaultConfig.isHideTopLine = YES;
    defaultConfig.isHideBottomLine = YES;
    defaultConfig.isHideUnderLine = NO;
    defaultConfig.isZoomFont = NO;
    defaultConfig.normalFont = [UIFont systemFontOfSize:13];
    defaultConfig.zoomFont = [UIFont systemFontOfSize:16];
    defaultConfig.normalColor = lxy_Color_999999;
    defaultConfig.selectColor = lxy_Color_333333;
    defaultConfig.topLineColor = lxy_LineColor;
    defaultConfig.bottomLineColor = lxy_LineColor;
    defaultConfig.underLineColor = lxy_Color_333333;
    defaultConfig.titleFrame = CGRectMake(0, 0, lxy_ScreenWidth, 45);
    defaultConfig.underLineW = 15;
    defaultConfig.underLineH = 3.0;
    defaultConfig.screenShowCount = 5;
    
    return defaultConfig;
}
@end
