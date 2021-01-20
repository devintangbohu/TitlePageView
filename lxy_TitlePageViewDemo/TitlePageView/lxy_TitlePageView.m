//
//  lxy_TitlePageView.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "lxy_TitlePageView.h"
#import "lxy_ScrollView.h"

@interface lxy_TitlePageView()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
/* 控制器数组*/
@property (nonatomic ,strong)NSArray<UIViewController *>* childArr;
/* 标题数组*/
@property (nonatomic ,strong) NSArray *titleArr;
/* 滚动视图*/
@property (nonatomic ,weak)lxy_ScrollView *scrollView;
/* 标题视图*/
@property (nonatomic ,weak)lxy_TitleView *titleView;
/** 配置 */
@property (nonatomic, strong) lxy_TitleViewConfig *config;

@end


@implementation lxy_TitlePageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [NSException raise:@"不能调用 initWithFrame 或者 init 初始化" format: @"必须调用 initWithFrame : childViewControllers: titleArr: titleFrame: isZoomFont: 初始化"];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame childViewControllers:(NSArray<UIViewController *>*)childArr titleArr:(NSArray<NSString *>*)titleArr config:(lxy_TitleViewConfig *)config{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTitleViewUIWithChildViewControllers:childArr titleArr:titleArr config:config];
    }
    return self;
}


-(void)initTitleViewUIWithChildViewControllers:(NSArray<UIViewController * >*)childArr titleArr:(NSArray <NSString *>*)titleArr config:(lxy_TitleViewConfig *)config{
    lxy_SelfWeak;
    self.childArr = childArr;
    self.titleArr = titleArr;
    self.config   = config;
    
    CGFloat scrollH = self.height - config.titleFrame.size.height;
    
    lxy_TitleView *titleView = [[lxy_TitleView alloc] initWithConfig:config];
    titleView.titleArr = titleArr;
    //点击按钮时，scrollView滚动到对应位置
    titleView.selectBtnAtIndex = ^(NSUInteger index) {
        [weakSelf scrollViewScrollToIndex:index];
        if (self.selectBtnAtIndex) {
            self.selectBtnAtIndex(index, titleArr[index]);
        }
    };
    titleView.addChildViewIntoScrollViewBlock = ^{
        [weakSelf addChildVcViewIntoScrollView];
    };
    self.titleView = titleView;

    
    lxy_ScrollView *scrollView = [[lxy_ScrollView alloc] initWithFrame:CGRectMake(0, titleView.bottom, self.width, scrollH)];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = NO;
   
    NSUInteger count = self.childArr.count;
    scrollView.contentSize = CGSizeMake(count * scrollView.width, 0);
    
    self.scrollView = scrollView;
    [self addSubview:titleView];
    [self addSubview:scrollView];
 
}

-(void)scrollViewScrollToIndex:(NSUInteger)index{
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = index * self.scrollView.width;
    self.scrollView.contentOffset = offset;
}

-(void)addChildVcViewIntoScrollView{
    
      // 取出对应位置的子控制器
       NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.width;
       UIViewController *childVc = self.childArr[index];
       childVc.view.frame = self.scrollView.bounds;
       [self.scrollView addSubview:childVc.view];
}

#pragma mark - UIScrollView代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 获得对应的按钮
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.width;
    [self.titleView selectBtnAtIndex:index];
    
    if (self.selectBtnAtIndex) {
        self.selectBtnAtIndex(index, _titleArr[index]);
    }
   
}

@end
