//
//  RightTitlePageViewController.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "RightTitlePageViewController.h"
#import "lxy_TitlePageView.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface RightTitlePageViewController ()
/** 数据 */
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation RightTitlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.titleArr = @[@"第一个",@"第二个"];
    OneViewController *oneVC = [[OneViewController alloc] init];
    TwoViewController *twoVC = [[TwoViewController alloc] init];
       
    for (NSString * title in _titleArr) {
        if ([title isEqualToString: @"第一个"]) {
            [self addChildViewController:oneVC];
        }else if ([title isEqualToString: @"第二个"]){
            [self addChildViewController:twoVC];
        }
    }
    
    CGFloat titleW =  120;
    CGFloat titleX = self.view.width - titleW - 10;
    CGFloat titlePageY = 90;
    CGFloat titlePageH = self.view.height -  titlePageY;
    
    lxy_TitleViewConfig *config = [lxy_TitleViewConfig defaultConfig];
    config.titleFrame = CGRectMake(titleX, 0, titleW, 35);
    config.normalFont = [UIFont systemFontOfSize:14];
    config.zoomFont = [UIFont systemFontOfSize:18];
    config.selectColor = [UIColor blackColor];
    config. underLineColor = [UIColor blackColor];
    config.isZoomFont = YES;
    config.screenShowCount = 4.5;
    lxy_TitlePageView *titlePageView = [[lxy_TitlePageView alloc] initWithFrame:CGRectMake(0, titlePageY, self.view.width, titlePageH) childViewControllers: self.childViewControllers titleArr: _titleArr config:config];
      
    [self.view addSubview:titlePageView];

}

@end
