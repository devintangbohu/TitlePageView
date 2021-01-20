//
//  TitlePageViewUseController.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "TitlePageViewUseController.h"
#import "lxy_TitleView.h"
#import "DefaultTitlePageViewController.h"
#import "CenterTitlePageViewController.h"
#import "LeftTitlePageViewController.h"
#import "RightTitlePageViewController.h"
#import "CasualTitlePageViewController.h"


@interface TitlePageViewUseController ()<UITableViewDelegate,UITableViewDataSource>
/** titleTableView */
@property (nonatomic, strong) UITableView *titleTableView;
/** 数据 */
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation TitlePageViewUseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"titlePageView的使用";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleTableView];
    
}



#pragma mark ---- tableView代理和数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        DefaultTitlePageViewController *centerVC = [[DefaultTitlePageViewController alloc] init];
        [self.navigationController pushViewController:centerVC animated:true];
    }else if (indexPath.row == 1){
        CenterTitlePageViewController *centerVC = [[CenterTitlePageViewController alloc] init];
        [self.navigationController pushViewController:centerVC animated:true];
    }else if (indexPath.row == 2){
        LeftTitlePageViewController *leftVC = [[LeftTitlePageViewController alloc] init];
        [self.navigationController pushViewController:leftVC animated:true];
    }else if (indexPath.row == 3){
        RightTitlePageViewController *rightVC = [[RightTitlePageViewController alloc] init];
        [self.navigationController pushViewController:rightVC animated:true];
    }else if (indexPath.row == 4){
        CasualTitlePageViewController *casuaVC = [[CasualTitlePageViewController alloc] init];
        [self.navigationController pushViewController:casuaVC animated:true];
    }
    
    
}

#pragma mark ---- 懒加载

/** 懒加载 */
-(UITableView *)titleTableView{
    if (!_titleTableView) {
        CGFloat tableViewY = lxy_NavHeight;
        CGFloat tableViewH = self.view.height - tableViewY;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, self.view.width, tableViewH) style:UITableViewStylePlain];
        tableView.rowHeight = 60;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.backgroundColor = [UIColor whiteColor];
        _titleTableView = tableView;
    }
    return _titleTableView;
}

/** 懒加载 */
-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"titleView默认",@"titleView在中间，且满屏幕",@"titleView在左边，宽度自定义",@"titleView在右边，宽度自定义",@"titleView随便摆"];
    }
    return _dataArr;
}

@end
