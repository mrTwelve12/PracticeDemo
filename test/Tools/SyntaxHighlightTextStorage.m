//
//  SyntaxHighlightTextStorage.m
//  test
//
//  Created by 关作印 on 16/8/4.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "SyntaxHighlightTextStorage.h"

@implementation SyntaxHighlightTextStorage
{
    NSMutableAttributedString *_backingStore;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _backingStore = [NSMutableAttributedString new];
    }
    return self;
}

-(NSString *)string{
    return [_backingStore string];
}

-(id)attribute:(NSString *)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range{
    return [_backingStore attributesAtIndex:location effectiveRange:range];
}

-(void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str{
    NSLog(@"replaceCharactersInRange:%@withString:%@",NSStringFromRange(range),str);
    [self beginEditing];
    [_backingStore replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedCharacters | NSTextStorageEditedAttributes range:range changeInLength:str.length - range.length];
    [self endEditing];
}

-(void)setAttributes:(NSDictionary<NSString *,id> *)attrs range:(NSRange)range{
    NSLog(@"setAttributes:%@ range:%@",attrs,NSStringFromRange(range));
    [self beginEditing];
    [_backingStore setAttributes:attrs range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
    [self endEditing];
}

//processEditing在layout manager中文本修改时发送通知，它通常也是处理一些文本修改逻辑的好地方
-(void)processEditing{
    [super processEditing];
    static NSRegularExpression *expression;
    expression = expression ?: [NSRegularExpression regularExpressionWithPattern:@"(\\*\\w+(\\s\\w+)*\\*)\\s" options:0 error:NULL];
    NSRange paragaphRange = [self.string paragraphRangeForRange:self.editedRange];
    [self removeAttribute:NSForegroundColorAttributeName range:paragaphRange];
    
    [expression enumerateMatchesInString:self.string options:0 range:paragaphRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        [self addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:result.range];
    }];
}
@end
