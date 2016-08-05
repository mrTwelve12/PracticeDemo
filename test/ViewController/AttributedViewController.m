//
//  TextKitViewController.m
//  test
//
//  Created by 关作印 on 16/8/3.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "AttributedViewController.h"
#import "CircleView.h"

@interface AttributedViewController ()
@property(nonatomic, strong) UILabel *label;

@end

@implementation AttributedViewController

-(UILabel *)label{
    if (!_label) {
        _label  = [[UILabel alloc]init];
    }
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];

    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        
    }];
    [self setAttributeStringLabel];
}

-(void)setAttributeStringLabel{
    NSString *str = @"bold, little color. hello";
    //NSMutableAttributedString的初始化
    NSDictionary *attrs = @{NSFontAttributeName :[UIFont preferredFontForTextStyle:UIFontTextStyleBody]};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:str attributes:attrs];
    
    //NSMutableAttributedString增加属性
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:36] range:[str rangeOfString:@"bold"]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:[str rangeOfString:@"little color"]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Papyrus" size:36] range:NSMakeRange(18, 5)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:[str rangeOfString:@"little"]];
    //NSMutableAttributedString移除属性
    NSDictionary *attrs2 = @{NSStrokeWidthAttributeName:@-5,
                             NSStrokeColorAttributeName:[UIColor greenColor],
                             NSFontAttributeName: [UIFont systemFontOfSize:36],
                             NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)};
    [attributedString setAttributes:attrs2 range:NSMakeRange(0, 4)];
    self.label.attributedText = attributedString;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
