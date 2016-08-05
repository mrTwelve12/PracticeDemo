//
//  CircleView.m
//  test
//
//  Created by 关作印 on 16/8/3.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView


- (void)drawRect:(CGRect)rect {
    [self.tintColor setFill];
    [[UIBezierPath bezierPathWithOvalInRect: self.bounds] fill];
}


@end
