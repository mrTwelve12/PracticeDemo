//
//  ViewController.m
//  test
//
//  Created by bluemobi on 16/4/20.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "ViewController.h"
#import "LayoutHeaderTableViewController.h"
#import "TableViewCell.h"
#import "PlayerViewController.h"
#import "TextKitTableViewController.h"
#import "BluetoothViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;
@end

@implementation ViewController

-(NSArray *)dataArray{
    
    if (_dataArray == nil) {
        _dataArray = @[@"头视图自适应变高",@"视频播放",@"TextKit",@"BluetoothViewController"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _label.text = @"汉化字体";
    _label.font = [UIFont fontWithName:@"FZMWJW--GB1-0" size:20.0];
    _tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.label.text = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            LayoutHeaderTableViewController *vc = [[LayoutHeaderTableViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:{
            PlayerViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PlayerViewController class])];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            TextKitTableViewController *vc = [[TextKitTableViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            BluetoothViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([BluetoothViewController class])];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}
@end



