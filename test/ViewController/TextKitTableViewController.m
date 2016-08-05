//
//  TextKitTableViewController.m
//  test
//
//  Created by 关作印 on 16/8/3.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "TextKitTableViewController.h"
#import "TableViewCell.h"
#import "AttributedViewController.h"
#import "InteractionViewController.h"
#import "DuplicateLayoutViewController.h"
#import "EditorViewController.h"

@interface TextKitTableViewController ()


@end

@implementation TextKitTableViewController{
    NSArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = @[@"Attributed",@"Interaction",@"DuplicateLayout"];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
       return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     UIStoryboard *storyboard = [UIStoryboard  storyboardWithName:@"Main"   bundle:nil];
    switch (indexPath.row) {
        case 0:{
            AttributedViewController *vc = [[AttributedViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:{
            InteractionViewController *vc = [[InteractionViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            DuplicateLayoutViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DuplicateLayoutViewController class])];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            EditorViewController *vc = [[EditorViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
