//
//  UIView+lxyExtension.h
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import <UIKit/UIKit.h>

@interface UIView (lxyExtension)

// @property在分类中只能生成 get set方法的声明 不会实现也不会生成_成员变量
/** frame宽度 */
@property (assign, nonatomic) CGFloat width;

//- (void)setWidth:(CGFloat)width;
//- (CGFloat)width;

/** frame高度 */
@property (assign, nonatomic) CGFloat height;
//- (void)setHeight:(CGFloat)height;
//- (CGFloat)height;

/** 原点坐标x */
@property (assign, nonatomic) CGFloat x;

/** 原点坐标y */
@property (assign, nonatomic) CGFloat y;

/** 坐标最大X */
@property (assign, nonatomic) CGFloat right;
/** 坐标最大Y */
@property (assign, nonatomic) CGFloat bottom;

/** 坐标最小X */
@property (assign, nonatomic) CGFloat left;
/** 坐标最小Y */
@property (assign, nonatomic) CGFloat top;


/** 中心点坐标x */
@property (assign, nonatomic) CGFloat centerX;

/** 中心点坐标y */
@property (assign, nonatomic) CGFloat centerY;

- (CGPoint)topRight;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;

@end
