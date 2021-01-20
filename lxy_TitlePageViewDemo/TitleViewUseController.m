//
//  TitleViewUseController.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "TitleViewUseController.h"
#import "lxy_TitleView.h"

@interface TitleViewUseController ()
/** 多个titleView  */
@property (nonatomic, strong) lxy_TitleView *oneTitleView;
/** 少数titleView  */
@property (nonatomic, strong) lxy_TitleView *twoTitleView;
/** 其他位置titleView */
@property (nonatomic, strong) lxy_TitleView *threeTitleView;
/** 放大字体  titleView*/
@property (nonatomic, strong) lxy_TitleView *fourTitleView;
/** 隐藏下划线  */
@property (nonatomic, strong) lxy_TitleView *fiveTitleView;
/** 修改文字颜色和下划线颜色*/
@property (nonatomic, strong) lxy_TitleView *sixTitleView;

/** 注释 */
@property (nonatomic, strong) NSArray *oneArr;
/** 注释 */
@property (nonatomic, strong) NSArray *twoArr;


@end

@implementation TitleViewUseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"试着点几下";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.oneTitleView];
    [self.view addSubview:self.twoTitleView];
    [self.view addSubview:self.threeTitleView];
    [self.view addSubview:self.fourTitleView];
    [self.view addSubview:self.fiveTitleView];
    [self.view addSubview:self.sixTitleView];
    
}
#pragma mark ---- 点击方法
-(void)oneTitleViewSelectBtnAtIndex:(NSUInteger)index{
    NSLog(@"点击了  %@",_oneArr[index]);
}

-(void)twoTitleViewSelectBtnAtIndex:(NSUInteger)index{
    NSLog(@"点击了  %@",_twoArr[index]);
}

#pragma mark ---- 懒加载

/** 懒加载 */
-(lxy_TitleView *)oneTitleView{
    if (!_oneTitleView) {
        lxy_SelfWeak;
        lxy_TitleViewConfig *config = [lxy_TitleViewConfig defaultConfig];
        config.titleFrame = CGRectMake(0, 100, self.view.width, 30);
        
        NSLog(@"%f",lxy_NavHeight);
        
        _oneTitleView = [[lxy_TitleView alloc] initWithConfig:config];
        //如果是网络请求获取的数据，titleArr属性 在网络请求成功之后赋值即可。
        _oneTitleView.titleArr = self.oneArr;
        _oneTitleView.backgroundColor = [UIColor yellowColor];
        _oneTitleView.selectBtnAtIndex = ^(NSUInteger index) {
            [weakSelf oneTitleViewSelectBtnAtIndex:index];
        };
        
    }
    return _oneTitleView;
}




/** 懒加载 */
-(lxy_TitleView *)twoTitleView{
    if (!_twoTitleView) {
        lxy_SelfWeak;
        lxy_TitleViewConfig *config = [lxy_TitleViewConfig defaultConfig];
        config.titleFrame = CGRectMake(0, self.oneTitleView.bottom + 50, self.view.width, 30);
        _twoTitleView = [[lxy_TitleView alloc] initWithConfig:config];
        //如果是网络请求获取的数据，titleArr属性 在网络请求成功之后赋值即可。
        _twoTitleView.titleArr = self.twoArr;
        _twoTitleView.backgroundColor = [UIColor yellowColor];
        _twoTitleView.selectBtnAtIndex = ^(NSUInteger index) {
            [weakSelf twoTitleViewSelectBtnAtIndex:index];
        };
    
    }
    return _twoTitleView;
}

/** 懒加载 */
-(lxy_TitleView *)threeTitleView{
    if (!_threeTitleView) {
        lxy_SelfWeak;
        lxy_TitleViewConfig *config = [lxy_TitleViewConfig defaultConfig];
        config.titleFrame = CGRectMake(50, self.twoTitleView.bottom + 50, 200, 50);
        _threeTitleView = [[lxy_TitleView alloc] initWithConfig:config];
        //如果是网络请求获取的数据，titleArr属性 在网络请求成功之后赋值即可。
        _threeTitleView.titleArr = self.oneArr;
        _threeTitleView.backgroundColor = [UIColor yellowColor];
        _threeTitleView.selectBtnAtIndex = ^(NSUInteger index) {
            [weakSelf oneTitleViewSelectBtnAtIndex:index];
        };
    
    }
    return _threeTitleView;
}

/** 懒加载 */
-(lxy_TitleView *)fourTitleView{
    if (!_fourTitleView) {
        lxy_SelfWeak;
        lxy_TitleViewConfig *config = [lxy_TitleViewConfig defaultConfig];
        config.titleFrame = CGRectMake(0, self.threeTitleView.bottom + 50, self.view.width, 45);
        config.zoomFont = [UIFont systemFontOfSize:25];
        config.isZoomFont = YES;
        _fourTitleView = [[lxy_TitleView alloc] initWithConfig:config];
        //如果是网络请求获取的数据，titleArr属性 在网络请求成功之后赋值即可。
        _fourTitleView.titleArr = self.oneArr;
        _fourTitleView.backgroundColor = [UIColor yellowColor];
        _fourTitleView.selectBtnAtIndex = ^(NSUInteger index) {
            [weakSelf oneTitleViewSelectBtnAtIndex:index];
        };
    
    }
    return _fourTitleView;
}

/** 懒加载 */
-(lxy_TitleView *)fiveTitleView{
    if (!_fiveTitleView) {
        lxy_SelfWeak;
        lxy_TitleViewConfig *config = [lxy_TitleViewConfig defaultConfig];
        config.titleFrame = CGRectMake(0, self.fourTitleView.bottom + 50, self.view.width, 45);
        config.selectColor = [UIColor redColor];
        config.isHideUnderLine = YES;
        
        _fiveTitleView = [[lxy_TitleView alloc] initWithConfig:config];
        //如果是网络请求获取的数据，titleArr属性 在网络请求成功之后赋值即可。
        _fiveTitleView.titleArr = self.oneArr;
        _fiveTitleView.backgroundColor = [UIColor yellowColor];
        _fiveTitleView.selectBtnAtIndex = ^(NSUInteger index) {
            [weakSelf oneTitleViewSelectBtnAtIndex:index];
        };
    
    }
    return _fiveTitleView;
}

/** 懒加载 */
-(lxy_TitleView *)sixTitleView{
    if (!_sixTitleView) {
        lxy_SelfWeak;
        lxy_TitleViewConfig *config = [lxy_TitleViewConfig defaultConfig];
        config.titleFrame = CGRectMake(0, self.fiveTitleView.bottom + 50, self.view.width, 45);
        config.isHideTopLine = NO;
        config.isHideBottomLine = NO;
        config.normalColor = [UIColor greenColor];
        config.selectColor = [UIColor redColor];
        config.underLineColor = [UIColor redColor];
        config.isZoomFont = YES;
        config.screenShowCount = 4.5;
        
        _sixTitleView = [[lxy_TitleView alloc] initWithConfig:config];
        //如果是网络请求获取的数据，titleArr属性 在网络请求成功之后赋值即可。
        _sixTitleView.titleArr = self.oneArr;
        _sixTitleView.backgroundColor = [UIColor yellowColor];
        _sixTitleView.selectBtnAtIndex = ^(NSUInteger index) {
            [weakSelf oneTitleViewSelectBtnAtIndex:index];
        };
    
    }
    return _sixTitleView;
}




/** 懒加载 */
-(NSArray *)oneArr{
    if (!_oneArr) {
        _oneArr = @[@"读书",@"写字",@"画画",@"谈恋爱",@"结婚",@"生孩子",@"老死"];
    }
    return _oneArr;
}

/** 懒加载 */
-(NSArray *)twoArr{
    if (!_twoArr) {
        _twoArr = @[@"就是",@"这么",@"少的字"];
    }
    return _twoArr;
}



@end
