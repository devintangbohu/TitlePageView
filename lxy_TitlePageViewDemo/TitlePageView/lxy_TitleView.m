//
//  lxy_TitleView.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "lxy_TitleView.h"

@interface lxy_TitleView()
/** 配置信息 */
@property (nonatomic, strong) lxy_TitleViewConfig *config;

/* 先前选中的按钮*/
@property (nonatomic ,weak) UIButton *previousBtn;
/* 上面的分割线*/
@property (nonatomic ,weak) UIView *topLine;
/* 下面分割线*/
@property (nonatomic ,weak) UIView *bottomLine;
/* 下划线*/
@property (nonatomic ,weak) UIView *underLine;
/** 子控件 */
@property (nonatomic, strong) NSMutableArray *subViewArr;

@end

@implementation lxy_TitleView


- (instancetype)initWithConfig:(lxy_TitleViewConfig *)config{
    self.config = config;
    NSAssert(!CGRectIsEmpty(config.titleFrame), @"lxy_TitleViewConfig 没有赋值属性 titleFrame");
    self = [super initWithFrame:config.titleFrame];
    if (self) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;

    }
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [NSException raise:@"不能调用 initWithFrame 或者 init 初始化" format: @"必须调用 initWithConfig 初始化"];
    }
    return self;
}

-(void)setTitleArr:(NSArray<NSString *>*)titleArr{
    _titleArr = titleArr;
    if (titleArr.count <= 0) {return;}
    //先移除子控件，再添加
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.subViewArr removeAllObjects];
    
    CGFloat showCount = titleArr.count > _config.screenShowCount ? _config.screenShowCount : titleArr.count;
    CGFloat itemW = self.width / showCount;
    
    for (int i = 0; i < titleArr.count; i++) {
        CGFloat itemX = i*itemW;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(itemX, 0, itemW, self.height)];
        btn.tag = i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:_config.normalColor forState:UIControlStateNormal];
        [btn setTitleColor:_config.selectColor forState:UIControlStateSelected];
        btn.titleLabel.font = _config.normalFont;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.subViewArr addObject:btn];
    }
    
    CGFloat underLineH = _config.underLineH;
    CGFloat topLineH = 0.5;
    CGFloat topLineY = self.height - topLineH;
    CGFloat underLineY = self.height - underLineH - topLineH;
    
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, topLineH)];
    topLine.backgroundColor = _config.topLineColor;
    topLine.hidden = YES;
    self.topLine = topLine;
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, topLineY, self.width, topLineH)];
    bottomLine.backgroundColor = _config.bottomLineColor;
    bottomLine.hidden = YES;
    self.bottomLine = bottomLine;
    
    UIView *underLine = [[UIView alloc] initWithFrame:CGRectMake(10, underLineY, _config.underLineW, underLineH)];
    underLine.backgroundColor = _config.underLineColor;
    self.underLine= underLine;
    
    [self addSubview:topLine];
    [self addSubview:bottomLine];
    [self addSubview:underLine];
    
    CGFloat contentW = itemW*titleArr.count;
    self.contentSize = CGSizeMake(contentW, self.height);
    topLine.width = bottomLine.width = contentW;
    
    if (_config.isNormalSelect) {
        //默认选择第1个按钮
        [self selectBtnAtIndex:0];
    }else{
        id view = self.subViewArr[0];
        if ([view isKindOfClass:[UIButton class]]) {
            [self setupUnderLineWidth:view];
        }
    }
    
    topLine.hidden = _config.isHideTopLine;
    bottomLine.hidden = _config.isHideBottomLine;
    underLine.hidden = _config.isHideUnderLine;
}


-(void)setupUnderLineWidth:(UIButton *)btn{
    //设置下划线
    self.underLine.centerX = btn.centerX;
}


-(void)btnClick:(UIButton *)btn{

    self.previousBtn.titleLabel.font = _config.normalFont;
    btn.titleLabel.font = _config.isZoomFont ? _config.zoomFont :  _config.normalFont;
    self.previousBtn.selected = NO;
    btn.selected = YES;
    self.previousBtn = btn;

    __block CGPoint offset = self.contentOffset;
    CGFloat btnOffsetX = btn.centerX - self.width*0.5;
    CGFloat offsetMax = self.contentSize.width - self.width;

    [UIView animateWithDuration:0.25 animations:^{
        //设置下划线
        [self setupUnderLineWidth:btn];
        
        offset.x = btnOffsetX >= 0 ? (btnOffsetX >= offsetMax ? offsetMax : btnOffsetX ) : 0;
        self.contentOffset = offset;
        
//            让scrollView滚动到对应位置
        if (self.selectBtnAtIndex) {
            self.selectBtnAtIndex(btn.tag);
        }
           
       } completion:^(BOOL finished) {
           if (self.addChildViewIntoScrollViewBlock) {
               self.addChildViewIntoScrollViewBlock();
           }
       }];

}


-(void)selectBtnAtIndex:(NSUInteger)index{
    id view = self.subViewArr[index];
    
    if ([view isKindOfClass:[UIButton class]]) {
        [self btnClick: view];
    }
}

/** 懒加载 */
-(NSMutableArray *)subViewArr{
    if (!_subViewArr) {
        _subViewArr = [NSMutableArray array];
    }
    return _subViewArr;
}


@end
