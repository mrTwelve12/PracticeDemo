//
//  EditorViewController.m
//  test
//
//  Created by 关作印 on 16/8/4.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "EditorViewController.h"
#import "SyntaxHighlightTextStorage.h"

#define KString @"~Shopping List~ *Cheese* _Biscuits_ -Sausages- IMPORTANT @庄洁元 #话题# http://www.baidu.com"
#define ksize self.view.bouds.size
@interface EditorViewController ()<UITextViewDelegate>
@property (strong,nonatomic) UITextView *textView;
@end

@implementation EditorViewController{
    SyntaxHighlightTextStorage* _textStorage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(preferredContentSizeChanged:)
                                                name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    _textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [self createTextView];
}


- (void)createTextView {
    _textStorage = [SyntaxHighlightTextStorage new];
    [_textStorage addLayoutManager: self.textView.layoutManager];
    
    [_textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:@"在从 Interface 文件中载入时，可以像这样将它插入文本视图,然后加 *星号* 的字就会高亮出来了"];
    _textView.delegate = self;
}


-(void)preferredContentSizeChanged:(NSNotification *)notification{
    _textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
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
