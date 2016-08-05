//
//  InteractionViewController.m
//  test
//
//  Created by 关作印 on 16/8/3.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "InteractionViewController.h"

@interface InteractionViewController ()<UITextViewDelegate>
{
    CGPoint _panOffset;
}
@end

@implementation InteractionViewController

-(CircleView *)circleView{
    if (!_circleView) {
        _circleView = [[CircleView alloc]initWithFrame:CGRectMake(83, 39 ,172 ,142)];
        _circleView.backgroundColor = [UIColor clearColor];
    }
    return _circleView;
}

-(UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 20, 320, 499)];
    }
    return _textView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.circleView];
    
    NSString *str = @"iOS 上的 NSTextContainer 提供了exclusionPaths，它允许开发者设置一个 NSBezierPath 数组来指定不可填充文本的区域,以下是转换方法,将它的 bounds（self.circleView.bounds）转换到 Text View 的坐标系统:";
    
    [self.textView.textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:str];
    
    _textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(preferredContentSizeChanged:)
                                                name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    [self updateExclusionPaths];
}

-(void)updateExclusionPaths{
 
    CGRect ovalFrame = [self.textView convertRect:self.circleView.bounds fromView:self.circleView];
    
    ovalFrame.origin.x -= self.textView.textContainerInset.left;
    ovalFrame.origin.y -= self.textView.textContainerInset.top;
    
    self.textView.textContainer.exclusionPaths = @[[UIBezierPath bezierPathWithOvalInRect: ovalFrame]];
}
-(void)preferredContentSizeChanged:(NSNotification *)notification{
    _textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

@end
