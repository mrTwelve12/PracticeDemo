//
//  PlayerView.m
//  test
//
//  Created by 关作印 on 16/7/29.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//由于默认的layer是CALayer，而AVPlayer只能添加至AVPlayerLayer中，所以我们改变一下layerClass，这样PlayerView的默认layer就变了
+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}
@end
