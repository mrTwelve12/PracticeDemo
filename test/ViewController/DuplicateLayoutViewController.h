//
//  DuplicateLayoutViewController.h
//  test
//
//  Created by 关作印 on 16/8/3.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DuplicateLayoutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *originalTextView;
@property (weak, nonatomic) IBOutlet UIView *otherContainerView;
@property (weak, nonatomic) IBOutlet UIView *thirdContainerView;
@end
