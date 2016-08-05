//
//  Config.m
//  TianjinBoHai
//
//  Created by 李莹 on 15/1/16.
//  Copyright (c) 2015年 Binky Lee. All rights reserved.
//

#import "Config.h"

/**
 *  文字\按钮  蓝色
 */
NSString *blueColor = @"16a5af";

/**
 *  文字\按钮  橘色
 */
NSString *orangeColor = @"f2aa43";

/**
 *  文字 黑色
 */
NSString *blackColor = @"555555";

/**
 *  文字 粉红色
 */
NSString *pinkColor = @"f16c6f";

/**
 *  文字 灰色
 */
NSString *grayColor = @"666666";

/**
 *  文字 浅灰色
 */
NSString * lightGrayColor = @"f2f2f2";

/**
 *  红色
 */
NSString * redColor = @"ff0b00";

/**
 *  黄色
 */
NSString * yellowColor = @"f4bb00";

NSString * backgroundGrayColor = @"f0f0f0";
//字浅灰
NSString * wordLightGrayColor = @"a3a3a3";
@implementation Config
UIColor* getColor(NSString * hexColor)
{
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}

@end
