//
//  lxy_TitleView.h
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import <UIKit/UIKit.h>
#import "lxy_TitleViewConfig.h"
#import "UIView+lxyExtension.h"

NS_ASSUME_NONNULL_BEGIN


@interface lxy_TitleView : UIScrollView

/** 自定义初始化方法 */
- (instancetype)initWithConfig:(lxy_TitleViewConfig *)config;

/* 数据*/
@property (nonatomic ,strong) NSArray<NSString *> *titleArr;

/* 点击了第几个按钮 */
@property (nonatomic ,copy) void (^selectBtnAtIndex)(NSUInteger index);

/* 下划线滚动完成时,scrollView滚动到对应位置 */
@property (nonatomic ,copy) void (^addChildViewIntoScrollViewBlock)(void);

//选择第几个按钮
-(void)selectBtnAtIndex:(NSUInteger)index;


@end

NS_ASSUME_NONNULL_END
