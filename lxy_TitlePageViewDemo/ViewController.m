//
//  ViewController.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "ViewController.h"
#import "lxy_TitleView.h"
#import "TitleViewUseController.h"
#import "TitlePageViewUseController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** titleTableView */
@property (nonatomic, strong) UITableView *titleTableView;
/** 数据 */
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"titlePageViewDemo";
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
        TitleViewUseController *titleViewUseVC = [[TitleViewUseController alloc] init];
        [self.navigationController pushViewController:titleViewUseVC animated:true];
        
    }else if (indexPath.row == 1){
        TitlePageViewUseController *titlePageViewUseVC = [[TitlePageViewUseController alloc] init];
        [self.navigationController pushViewController:titlePageViewUseVC animated:true];
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
        _dataArr = @[@"titleView的使用",@"titlePageView的使用"];
    }
    return _dataArr;
}





@end
