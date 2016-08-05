//
//  LayoutHeaderTableViewController.m
//  test
//
//  Created by 关作印 on 16/7/29.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "LayoutHeaderTableViewController.h"

@interface LayoutHeaderTableViewController ()
@property (nonatomic, strong) UIView *answerTableHeaderView;
@end

@implementation LayoutHeaderTableViewController

-(UIView *)answerTableHeaderView{
    if (!_answerTableHeaderView) {
        _answerTableHeaderView = [[UIView alloc]init];
        _answerTableHeaderView.backgroundColor = [UIColor grayColor];
        UILabel *answerNameLabel = [UILabel new];
        [_answerTableHeaderView addSubview:answerNameLabel];
        answerNameLabel.font = DEF_FontSize_MID;
        answerNameLabel.numberOfLines = 0;
        answerNameLabel.text = @"**78797897946546431313134897987979777777887878878878878887878787878787878787878787887887878897987987894865132135465132135489798415445465464648979884";
        [answerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo (_answerTableHeaderView);
            make.width.mas_offset(SCREEN_WIDTH);
        }];
        [_answerTableHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo (answerNameLabel);
        }];
        
        
    }
    return _answerTableHeaderView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.answerTableHeaderView layoutIfNeeded];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableHeaderView = self.answerTableHeaderView;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
