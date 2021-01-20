//
//  DefaultTitlePageViewController.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "DefaultTitlePageViewController.h"
#import "lxy_TitlePageView.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"

@interface DefaultTitlePageViewController ()
/** 数据 */
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation DefaultTitlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleArr = @[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个",@"第六个"];
    OneViewController *oneVC = [[OneViewController alloc] init];
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    FourViewController *fourVC = [[FourViewController alloc] init];
    FiveViewController *fiveVC = [[FiveViewController alloc] init];
    SixViewController *sixVC = [[SixViewController alloc] init];
       
    for (NSString * title in _titleArr) {
        if ([title isEqualToString: @"第一个"]) {
            [self addChildViewController:oneVC];
        }else if ([title isEqualToString: @"第二个"]){
            [self addChildViewController:twoVC];
        }else if ([title isEqualToString: @"第三个"]){
            [self addChildViewController:threeVC];
        }else if ([title isEqualToString: @"第四个"]){
            [self addChildViewController:fourVC];
        }else if ([title isEqualToString: @"第五个"]){
            [self addChildViewController:fiveVC];
        }else if ([title isEqualToString: @"第六个"]){
            [self addChildViewController:sixVC];
        }
    }
    CGFloat titlePageY = 90;
    CGFloat titlePageH = self.view.height -  titlePageY;
    lxy_TitlePageView *titlePageView = [[lxy_TitlePageView alloc] initWithFrame:CGRectMake(0, titlePageY, self.view.width, titlePageH) childViewControllers: self.childViewControllers titleArr: _titleArr config:[lxy_TitleViewConfig defaultConfig]];
      
    [self.view addSubview:titlePageView];
}


@end
