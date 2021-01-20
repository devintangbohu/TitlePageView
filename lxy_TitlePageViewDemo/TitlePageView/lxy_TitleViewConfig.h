//
//  lxy_TitleViewConfig.h
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "lxy_Define.h"

NS_ASSUME_NONNULL_BEGIN

@interface lxy_TitleViewConfig : NSObject
/** 是否需要要默认选中 */
@property (nonatomic, assign) BOOL isNormalSelect;
/** 是否隐藏上面的细线 */
@property (nonatomic, assign) BOOL isHideTopLine;
/** 是否隐藏下面的细线 */
@property (nonatomic, assign) BOOL isHideBottomLine;
/** 是隐藏下面的下划线(滑动的线) */
@property (nonatomic, assign) BOOL isHideUnderLine;
/** 是否需要缩放字体 */
@property (nonatomic, assign) BOOL isZoomFont;
/** 默认文字大小 */
@property (nonatomic, strong) UIFont *normalFont;
/** 放大字体 (只有 isZoomFont 设置为YES , 此值才能有效 ) */
@property (nonatomic, strong) UIFont *zoomFont;
/** 默认文字颜色 */
@property (nonatomic, strong) UIColor *normalColor;
/** 选中文字颜色 */
@property (nonatomic, strong) UIColor *selectColor;
/** 上面的细线颜色 */
@property (nonatomic, strong) UIColor *topLineColor;
/** 下面的细线颜色 */
@property (nonatomic, strong) UIColor *bottomLineColor;
/** 下划线颜色 */
@property (nonatomic, strong) UIColor *underLineColor;
/** 标签视图的frame */
@property (nonatomic, assign) CGRect titleFrame;
/** 下划线高度 */
@property (nonatomic, assign) CGFloat underLineH;
/** 下划线宽度 */
@property (nonatomic, assign) CGFloat underLineW;
/** 一屏幕显示的最多个数( 可以赋值小数，这样会显示不全 会遮住一部分 ) */
@property (nonatomic, assign) CGFloat screenShowCount;

/** 默认初始化方法*/
+ (lxy_TitleViewConfig *)defaultConfig;

@end

NS_ASSUME_NONNULL_END
