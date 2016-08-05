//
//  DuplicateLayoutViewController.m
//  test
//
//  Created by 关作印 on 16/8/3.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "DuplicateLayoutViewController.h"
#define kstring @"如上图所示，它们的关系是 1 对 N 的关系。就是那样：一个 Text Storage 可以拥有多个 Layout Manager，一个 Layout Manager 也可以拥有多个 Text Container。这些多重性带来了多容器布局的特性"
@interface DuplicateLayoutViewController ()

@property(weak,nonatomic)UITextView *otherTextView;
@property(weak,nonatomic)UITextView *thirdTextView;

@end
//NSTextStorage:它是NSMutableAttributedString的子类，里面存的是要管理的文本。
//NSLayoutManager:管理文本布局方式
//NSTextContainer:表示文本要填充的区域
@implementation DuplicateLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load text
    NSTextStorage *sharedTextStorage = self.originalTextView.textStorage;
    [sharedTextStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:kstring];
    
    //将一个新的Layout Manage附件到上面的Text Storage上
    NSLayoutManager *otherLayoutManager = [NSLayoutManager new];
    [sharedTextStorage addLayoutManager:otherLayoutManager];
    
    NSTextContainer *otherTextContainer = [NSTextContainer new];
    [otherLayoutManager addTextContainer:otherTextContainer];
    
    UITextView *otherTextView = [[UITextView alloc]initWithFrame:self.otherContainerView.bounds textContainer:otherTextContainer];
    otherTextView.backgroundColor = self.otherContainerView.backgroundColor;
//    otherTextView.translatesAutoresizingMaskIntoConstraints = YES;
//    otherTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    otherTextView.scrollEnabled = NO;
    
    [self.otherContainerView addSubview:otherTextView];
    self.otherTextView = otherTextView;
    
    //讲一个新的Text Container附加到同一个Layout Manager ,这样可以将一个文本分布到多个视图展现出来。
    NSTextContainer *thirdTextContainer = [NSTextContainer new];
    [otherLayoutManager addTextContainer:thirdTextContainer];
    
    UITextView *thirdTextView = [[UITextView alloc]initWithFrame:self.thirdContainerView.bounds textContainer:thirdTextContainer];
    thirdTextView.backgroundColor = self.thirdContainerView.backgroundColor;
//    thirdTextView.translatesAutoresizingMaskIntoConstraints = YES;
//    thirdTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    thirdTextView.scrollEnabled = NO;
    
    [self.thirdContainerView addSubview:thirdTextView];
    self.thirdTextView = thirdTextView;
    // Do any additional setup after loading the view.
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
