//
//  lxy_TitlePageView.h
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import <UIKit/UIKit.h>
#import "lxy_TitleView.h"

NS_ASSUME_NONNULL_BEGIN

@interface lxy_TitlePageView : UIView
/**
 *prama :
 *childArr : 添加此视图的控制器添加的子控件数组
 *titleArr ：上面标签视图数据
 *config ：标签栏配置
 */

-(instancetype)initWithFrame:(CGRect)frame childViewControllers:(NSArray<UIViewController *>*)childArr titleArr:(NSArray<NSString *>*)titleArr config:(lxy_TitleViewConfig *)config;

/** 选中的按钮 */
@property (nonatomic, copy) void(^selectBtnAtIndex)(NSUInteger index,NSString *titleStr);


@end

NS_ASSUME_NONNULL_END
