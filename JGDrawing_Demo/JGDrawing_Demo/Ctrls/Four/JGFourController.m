//
//  JGFourController.m
//  JGDrawing_Demo
//
//  Created by 郭军 on 2019/6/1.
//  Copyright © 2019 JG. All rights reserved.
//  本文案例来自https://github.com/MengLiMing/MLMProgressCollection

#import "JGFourController.h"

@interface JGFourController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *listArray;
}


@property (nonatomic, strong)UITableView *tableView;

@end

@implementation JGFourController

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.delaysContentTouches = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      listArray = @[@"进度",@"刻度",@"合体",@"统计",@"水波"];
    [self.view addSubview:self.tableView];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.selectionStyle = 0;
    cell.textLabel.text = listArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            UIViewController *vc = [NSClassFromString(@"ProgressViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            vc.title = listArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            UIViewController *vc = [NSClassFromString(@"CalibrationViewController") new];
             vc.hidesBottomBarWhenPushed = YES;
            vc.title = listArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            UIViewController *vc = [NSClassFromString(@"TotalProgressVC") new];
             vc.hidesBottomBarWhenPushed = YES;
            vc.title = listArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            UIViewController *vc = [NSClassFromString(@"StatisticalVC") new];
             vc.hidesBottomBarWhenPushed = YES;
            vc.title = listArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            UIViewController *vc = [NSClassFromString(@"WaterWaveVC") new];
             vc.hidesBottomBarWhenPushed = YES;
            vc.title = listArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
