//
//  Config.h
//  TianjinBoHai
//
//  Created by 李莹 on 15/1/16.
//  Copyright (c) 2015年 Binky Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#pragma mark --------log

/**
 *  文字按钮  蓝色
 */
extern NSString *blueColor;

/**
 *  文字按钮  橘色
 */
extern NSString *orangeColor;

/**
 *  文字 黑色
 */
extern NSString *blackColor;

/**
 *  文字 粉红色
 */
extern NSString *pinkColor;

/**
 *  灰色
 */
extern NSString *grayColor;

/**
 *  浅灰色
 */
extern NSString *lightGrayColor;

/**
 *  红色
 */
extern NSString *redColor;

/**
 *  黄色
 */
extern NSString *yellowColor;

//背景灰
extern NSString *backgroundGrayColor;
//浅灰字
extern NSString *wordLightGrayColor;

//文件目录
#define kPathTemp                   NSTemporaryDirectory()
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define VOTETEXTCOLOR [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1]
//打印方法名，行数
#ifdef DEBUG
#   define DLOG(fmt, ...) NSLog((@"********\n%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLOG(...)
#endif

//debug log
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define DLogRect(rect)  DLog(@"%s x=%f, y=%f, w=%f, h=%f", #rect, rect.origin.x, rect.origin.y,rect.size.width, rect.size.height)
#   define DLogPoint(pt) DLog(@"%s x=%f, y=%f", #pt, pt.x, pt.y)
#   define DLogSize(size) DLog(@"%s w=%f, h=%f", #size, size.width, size.height)
#   define DLogColor(_COLOR) DLog(@"%s h=%f, s=%f, v=%f", #_COLOR, _COLOR.hue, _COLOR.saturation, _COLOR.value)
#   define DLogSuperViews(_VIEW) { for (UIView* view = _VIEW; view; view = view.superview) { GBLog(@"%@", view); } }
#   define DLogSubViews(_VIEW) \
{ for (UIView* view in [_VIEW subviews]) { GBLog(@"%@", view); } }
#   else
#   define DLog(...)
#   define DLogRect(rect)
#   define DLogPoint(pt)
#   define DLogSize(size)
#   define DLogColor(_COLOR)
#   define DLogSuperViews(_VIEW)
#   define DLogSubViews(_VIEW)
#   endif

#define DEF_SUCESS_CODE @"yes"
#define DEF_ERROR_CODE @"no"

#define DOBJ(obj)  DLOG(@"%s: %@", #obj, [(obj) description])
//当前方法和行数
#define MARK    NSLog(@"********%@\nMARK: %s, %d",[self class] , __PRETTY_FUNCTION__, __LINE__)
//输出日志
#define _po(o) DLOG(@"%@", (o))
#define _pn(o) DLOG(@"%d", (o))
#define _pf(o) DLOG(@"%f", (o))
#define _ps(o) DLOG(@"CGSize: {%.0f, %.0f}", (o).width, (o).height)
#define _pr(o) DLOG(@"NSRect: {{%.0f, %.0f}, {%.0f, %.0f}}", (o).origin.x, (o).origin.x, (o).size.width, (o).size.height)

#ifdef DEBUG

/// DEBUG模式下进行调试打印

#define DEF_DEBUG(...)   NSLog(__VA_ARGS__)

#else

#define DEF_DEBUG(...)   {}

#endif

//通用字号
#define DEF_FontSize_20 [UIFont systemFontOfSize:20]
#define DEF_FontSize_19 [UIFont systemFontOfSize:19]
#define DEF_FontSize_18 [UIFont systemFontOfSize:18]
#define DEF_FontSize_17 [UIFont systemFontOfSize:17]
#define DEF_FontSize_16 [UIFont systemFontOfSize:16]
#define DEF_FontSize_15 [UIFont systemFontOfSize:15]
#define DEF_FontSize_14 [UIFont systemFontOfSize:14]
#define DEF_FontSize_13 [UIFont systemFontOfSize:13]
#define DEF_FontSize_12 [UIFont systemFontOfSize:12]
#define DEF_FontSize_11 [UIFont systemFontOfSize:11]
#define DEF_FontSize_10 [UIFont systemFontOfSize:10]
#define DEF_FontSize_8 [UIFont systemFontOfSize:8]

#define DEF_FontSize_BIG [UIFont systemFontOfSize:16]
#define DEF_FontSize_MID [UIFont systemFontOfSize:14]
#define DEF_FontSize_SMA [UIFont systemFontOfSize:12]

//屏幕宽高

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//5S宽高比例

#define WIDTH_5S_SCALE 320.0 * [UIScreen mainScreen].bounds.size.width
#define HEIGHT_5S_SCALE 568.0 * [UIScreen mainScreen].bounds.size.height


#define Transform_h(h) (h/320.f*[UIScreen mainScreen].bounds.size.width)//水平
#define Transform_v(v) (v/568.f*[UIScreen mainScreen].bounds.size.height)//垂直


/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

@interface Config : NSObject
UIColor* getColor(NSString * hexColor);
@end
